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
    let nearby_restaurants : [NearbyRestaurants]?
    
    enum CodingKeys: String, CodingKey {
        
        case location = "location"
        case popularity = "popularity"
        case link = "link"
        case nearby_restaurants = "nearby_restaurants"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        popularity = try values.decodeIfPresent(Popularity.self, forKey: .popularity)
        link = try values.decodeIfPresent(String.self, forKey: .link)
        nearby_restaurants = try values.decodeIfPresent([NearbyRestaurants].self, forKey: .nearby_restaurants)
    }
    
}
