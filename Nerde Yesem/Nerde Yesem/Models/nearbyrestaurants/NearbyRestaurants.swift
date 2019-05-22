//
//  NearbyRestaurants.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
struct NearbyRestaurants : Codable {
    let restaurant : Restaurant?
    
    enum CodingKeys: String, CodingKey {
        
        case restaurant = "restaurant"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        restaurant = try values.decodeIfPresent(Restaurant.self, forKey: .restaurant)
    }
    
}
