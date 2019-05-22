//
//  NearbyRestaurantViewModel.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
import UIKit

struct NearbyRestaurantViewModel {
    let restaurantName: String?
    //let restaurantDistance:String?
    let restaurantRating:String?
    let restaurantThumbnail:String?
}

extension NearbyRestaurantViewModel {
    init(nearbyRestaurant:Restaurant) {
        restaurantName = nearbyRestaurant.name
        //restaurantDistance = "distance"
        restaurantRating = nearbyRestaurant.user_rating?.aggregate_rating
        restaurantThumbnail = nearbyRestaurant.thumb
    }
}
