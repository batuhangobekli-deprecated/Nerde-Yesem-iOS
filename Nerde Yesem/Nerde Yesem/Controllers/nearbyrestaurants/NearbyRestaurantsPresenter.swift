//
//  NearbyRestaurantsPresenter.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
import Alamofire

class NearbyRestaurantsPresenter {
    private var nearbyRestaurantView:NearbyRestaurantsView!
    
    init(nearbyRestaurantView:NearbyRestaurantsView) {
        self.nearbyRestaurantView = nearbyRestaurantView
    }
    func getNearbyRestaurants(lat:Double,long:Double) {
        AF.request(APIRouter.nearbyRestaurants(lat: lat, long: long))
            .validate(statusCode: 200..<300)
            .responseDecodable { (response: DataResponse<NearbyRestaurantResponse>) in
                debugPrint(response)
                switch response.result {
                case .success(let nearbyRestaurants):
                    self.nearbyRestaurantView.onGetNearbyRestaurants(restaurants: nearbyRestaurants)
                    print("success")
                case .failure(let error):
                     print("fail")
                    break
                }
        }
    }
}
