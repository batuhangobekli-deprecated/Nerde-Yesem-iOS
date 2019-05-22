//
//  NerdeYesemApiClient.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper


class NerdeYesemApiClient: RequestAdapter{
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlrequest = urlRequest
        urlrequest.setValue("b32f1315bae0ada454480368f64206d6", forHTTPHeaderField: "user-key")
        return urlRequest
    }
}

