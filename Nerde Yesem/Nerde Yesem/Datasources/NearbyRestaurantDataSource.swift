//
//  NearbyRestaurantDataSource.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 23.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class NearbyRestaurantDataSource:NSObject,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    private var restaurants = [NearbyRestaurants]()
    
    init(restaurants:[NearbyRestaurants]) {
        self.restaurants = restaurants
        super.init()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NearbyRestaurantCell.reuseIdentifier, for: indexPath) as! NearbyRestaurantCell
        let restaurant = restaurants[indexPath.row]
        let viewModel = NearbyRestaurantViewModel(nearbyRestaurant: restaurant)
        cell.configure(with: viewModel)
        return cell
    }
    func restaurant(at indexPath:IndexPath)-> NearbyRestaurants {
        return restaurants[indexPath.row]
    }
    
    func update(with restaurants: [NearbyRestaurants]) {
        self.restaurants = restaurants
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 200)
    }
   
}

