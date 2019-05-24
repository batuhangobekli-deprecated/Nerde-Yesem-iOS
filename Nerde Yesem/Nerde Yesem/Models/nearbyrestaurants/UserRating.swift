//
//  UserRating.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
struct UserRating : Codable {
    let aggregate_rating : String = ""
    let rating_text : String = ""
    let rating_color : String = ""
    let votes : Int = 0
    
    enum CodingKeys: String, CodingKey {
        case aggregate_rating = "aggregate_rating"
        case rating_text = "rating_text"
        case rating_color = "rating_color"
        case votes = "votes"
    }
}
