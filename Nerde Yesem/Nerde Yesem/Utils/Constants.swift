//
//  Constants.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation

struct Constants {
    struct ProductionServer {
        static let baseURL = "https://developers.zomato.com/api/v2.1/"
    }
    
    struct APIParameterKey {
        static let lat = "lat"
        static let long = "long"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}


