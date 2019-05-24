//
//  NearbyRestaurantViewModel.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
import UIKit
import MapKit

struct NearbyRestaurantViewModel {
    let restaurantName: String?
  //  let restaurantDistance:CLLocation?
    let restaurantRating:String?
    let restaurantThumbnail:String?
}

extension NearbyRestaurantViewModel {
    init(nearbyRestaurant:NearbyRestaurants) {
        restaurantName = nearbyRestaurant.restaurant?.name
       // restaurantDistance = CLLocation(latitude: (nearbyRestaurant.restaurant?.location?.latitude)!, longitude: (nearbyRestaurant.restaurant?.location?.longitude)!)
        restaurantRating = nearbyRestaurant.restaurant?.user_rating?.aggregate_rating
        restaurantThumbnail = nearbyRestaurant.restaurant?.thumb
    }
}
