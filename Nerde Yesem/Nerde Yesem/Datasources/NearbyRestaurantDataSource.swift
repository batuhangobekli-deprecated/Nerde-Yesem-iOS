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
import MapKit


class NearbyRestaurantDataSource:NSObject,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    private var restaurants = [NearbyRestaurants]()
    private var location:CLLocation!
    
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
        cell.distanceLabel.text = NerdeYesemUtils.calculateDistance(lat_r:restaurant.restaurant?.location?.latitude?.toDouble, long_r: restaurant.restaurant?.location?.longitude?.toDouble, lat_a: location.coordinate.latitude, long_a: location.coordinate.longitude)
        cell.configure(with: viewModel)
        return cell
    }
    func restaurant(at indexPath:IndexPath)-> NearbyRestaurants {
        return restaurants[indexPath.row]
    }
    
    func update(with restaurants: [NearbyRestaurants],location:CLLocation) {
        self.restaurants = restaurants
        self.location = location
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 200)
    }
   
}

