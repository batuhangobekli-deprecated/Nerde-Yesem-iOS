//
//  ViewController.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 18.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import UIKit
import MapKit

class NearbyRestaurantsViewController: BaseViewController{
    var locationManager: CLLocationManager!
    var presenter:NearbyRestaurantsPresenter!
    var location:CLLocation!
    @IBOutlet weak var nearbyRestaurantCollectionView: UICollectionView!
    var dataSource = NearbyRestaurantDataSource(restaurants: [])
    
    //MARK:SEGUES
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if  segue.identifier == "showRestaurantDetail" {
            let cell = sender as! NearbyRestaurantCell
            if let indexPath = nearbyRestaurantCollectionView.indexPath(for: cell){
                let restaurant = dataSource.restaurant(at: indexPath)
                let receiverVC = segue.destination as! RestaurantDetailViewController
                receiverVC.restaurantID = restaurant.restaurant?.r?.res_id
            }
        }
    }
    
    override func viewDidLoad() {
        self.isLogoEnabled = true
        super.viewDidLoad()
        presenter = NearbyRestaurantsPresenter(nearbyRestaurantView: self)
        nearbyRestaurantCollectionView.dataSource = dataSource
        nearbyRestaurantCollectionView.delegate = dataSource
        configureLocationManager()
    }
    func configureLocationManager(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func getNearbyRestaurants(lat:Double,long:Double){
        presenter.getNearbyRestaurants(lat: lat, long: long)
    }
}

extension NearbyRestaurantsViewController:NearbyRestaurantsView{
    func onGetNearbyRestaurants(restaurants: NearbyRestaurantResponse) {
        dataSource.update(with: restaurants.nearby_restaurants, location: location)
        nearbyRestaurantCollectionView.reloadData()
        
    }
}

extension NearbyRestaurantsViewController:CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while getting location \(error)")
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        self.location = location
        locationManager.stopUpdatingLocation()
        getNearbyRestaurants(lat: location.coordinate.latitude, long: location.coordinate.longitude)
    }
}
