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
    
    override func viewDidLoad() {
        self.isLogoEnabled = true
        super.viewDidLoad()
        presenter = NearbyRestaurantsPresenter(nearbyRestaurantView: self)
        configureLocationManager()
    }
    func configureLocationManager(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension NearbyRestaurantsViewController:NearbyRestaurantsView{
    func onGetNearbyRestaurants(restaurants: NearbyRestaurantResponse) {
        
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
        print(location)
        //dinnerListDataSource?.setLocation(locResult: location)
        locationManager.stopUpdatingLocation()
    }
}
