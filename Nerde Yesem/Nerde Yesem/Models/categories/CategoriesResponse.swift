//
//  CategoriesResponse.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
struct CategoriesResponse : Codable {
   
    let categories : [Category]?
    
    enum CodingKeys: String, CodingKey {
        case categories = "categories"
    }
}
