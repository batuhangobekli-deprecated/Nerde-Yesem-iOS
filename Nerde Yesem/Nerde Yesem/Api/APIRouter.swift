//
//  ApiRouter.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    
    case nearbyRestaurants(lat:Double, long:Double)
    case categories
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .nearbyRestaurants:
            return .get
        case .categories:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .nearbyRestaurants:
            return "/geocode"
        case .categories:
            return "/categories"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .nearbyRestaurants(let lat, let long):
            return [Constants.APIParameterKey.lat: lat, Constants.APIParameterKey.long: long]
        case .categories:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue("b32f1315bae0ada454480368f64206d6", forHTTPHeaderField: "user-key")
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}



