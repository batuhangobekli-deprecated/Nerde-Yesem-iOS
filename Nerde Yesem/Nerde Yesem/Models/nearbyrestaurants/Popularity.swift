//
//  Popularity.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
struct Popularity : Codable {
    let nearby_res : [String]?
    let top_cuisines : [String]?
    let popularity_res : String?
    let nightlife_res : String?
    let subzone : String?
    let subzone_id : Int?
    let city : String?
    
    enum CodingKeys: String, CodingKey {
        
        case nearby_res = "nearby_res"
        case top_cuisines = "top_cuisines"
        case popularity_res = "popularity_res"
        case nightlife_res = "nightlife_res"
        case subzone = "subzone"
        case subzone_id = "subzone_id"
        case city = "city"
    }
    
    
    
}
