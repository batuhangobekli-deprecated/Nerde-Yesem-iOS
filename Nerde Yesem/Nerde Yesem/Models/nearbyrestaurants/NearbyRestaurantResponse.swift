//
//  NearbyRestaurantResponse.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
struct NearbyRestaurantResponse : Codable {
    let location : Location?
    let popularity : Popularity?
    let link : String?
    var nearby_restaurants : [NearbyRestaurants] = []
    
    enum CodingKeys: String, CodingKey {
        
        case location = "location"
        case popularity = "popularity"
        case link = "link"
        case nearby_restaurants = "nearby_restaurants"
    }
    
   
    
}
