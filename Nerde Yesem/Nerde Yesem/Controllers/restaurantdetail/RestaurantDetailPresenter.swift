//
//  RestaurantDetailPresenter.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 24.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
import Alamofire

class RestaurantDetailPresenter {
    private var restaurantDetailView:RestaurantDetailView!
    
    init(restaurantDetailView:RestaurantDetailView) {
        self.restaurantDetailView = restaurantDetailView
    }
    func getCategories(resId:Int) {
        AF.request(APIRouter.restaurant(resId: resId))
            .responseDecodable { (response: DataResponse<RestaurantDetailResponse>) in
                switch response.result {
                case .success(let restaurant):
                    self.restaurantDetailView.onGetRestaurantDetail(restaurant: restaurant)
                case .failure(let error):
                    break
                }
        }
    }
}
