//
//  RestaurantDetailViewController.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 24.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import UIKit
import GoogleMaps

struct RestaurantMarker {
    var lat:Double
    var long:Double
    var markerTitle:String!
}

class RestaurantDetailViewController: BaseViewController {
    @IBOutlet weak var restaurantThumbnail: UIImageView!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var ratingsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var locationMap: GMSMapView!
    var restaurantMarker:RestaurantMarker!
    var restaurantID:Int!
    var presenter:RestaurantDetailPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Restoran Detayı"
        locationMap.delegate = self
        presenter = RestaurantDetailPresenter(restaurantDetailView: self)
        getRestaurantDetail()
    }
    func addMarker(lat:Double,long:Double,markerSnippet:String){
        let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let marker = GMSMarker()
        marker.position = location
        marker.snippet = markerSnippet
        marker.appearAnimation = .pop
        marker.map = locationMap
        locationMap.animate(to: GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom:14.0))
    }
    func getRestaurantDetail(){
        presenter.getCategories(resId: restaurantID)
    }
}
extension RestaurantDetailViewController:GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        if restaurantMarker != nil {
            if position.target.latitude != restaurantMarker.lat || position.target.latitude != restaurantMarker.lat{
                self.locationMap.animate(to: GMSCameraPosition.camera(withLatitude: self.restaurantMarker.lat, longitude: self.restaurantMarker.long, zoom:14.0))
            }
        }
    }
    
}
extension RestaurantDetailViewController:RestaurantDetailView{
    func onGetRestaurantDetail(restaurant: RestaurantDetailResponse) {
        restaurantMarker = RestaurantMarker(lat: (restaurant.location?.latitude!.toDouble)!, long: (restaurant.location?.longitude!.toDouble)!, markerTitle: restaurant.name)
        addMarker(lat: restaurantMarker.lat , long:  restaurantMarker.long, markerSnippet: restaurantMarker.markerTitle)
        restaurantName.text = restaurant.name
        cuisineLabel.text = restaurant.cuisines
        ratingsLabel.text = "\(restaurant.user_rating?.votes ?? 0)"
        priceLabel.text = "\(restaurant.price_range ?? 0)" + "/5"
        NerdeYesemUtils.loadImage(resource: restaurantThumbnail, imageURL: restaurant.thumb!, placeHolder: UIImage(named: "logo") , isCircle: false)
    }
}
