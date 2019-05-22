//
//  Location.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
struct Location : Codable {
    let address : String?
    let locality : String?
    let city : String?
    let city_id : Int?
    let latitude : String?
    let longitude : String?
    let zipcode : String?
    let country_id : Int?
    let locality_verbose : String?
    
    enum CodingKeys: String, CodingKey {
        
        case address = "address"
        case locality = "locality"
        case city = "city"
        case city_id = "city_id"
        case latitude = "latitude"
        case longitude = "longitude"
        case zipcode = "zipcode"
        case country_id = "country_id"
        case locality_verbose = "locality_verbose"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        locality = try values.decodeIfPresent(String.self, forKey: .locality)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        city_id = try values.decodeIfPresent(Int.self, forKey: .city_id)
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
        country_id = try values.decodeIfPresent(Int.self, forKey: .country_id)
        locality_verbose = try values.decodeIfPresent(String.self, forKey: .locality_verbose)
    }
    
}

