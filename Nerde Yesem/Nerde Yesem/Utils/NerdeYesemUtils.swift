//
//  NerdeYesemUtils.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView
import Kingfisher
import MapKit

public class NerdeYesemUtils{
static func loadImage(resource:UIImageView,imageURL:String,placeHolder:UIImage!,isCircle:Bool!){
    if isCircle {
        resource.layer.cornerRadius = resource.frame.size.width / 2
        resource.contentMode = .scaleAspectFill
        resource.clipsToBounds = true
    }
    if imageURL != "" {
        resource.setImage(fromURL: URL(string: imageURL), withPlaceholderImage: placeHolder)
    }else {
        resource.image = placeHolder
    }
  }
static func calculateDistance(lat_r:Double?,long_r:Double?,lat_a:Double?,long_a:Double?)-> String{
        if let latitudeRestaurant = lat_r,let longitudeRestaurant = long_r,let latitude_a = lat_a,let longitude_a = long_a {
            let restaurantCoordinate = CLLocation(latitude: latitudeRestaurant, longitude: longitudeRestaurant)
            let currentCoordinate = CLLocation(latitude: latitude_a, longitude: longitude_a)
            let distanceInMeters = currentCoordinate.distance(from: restaurantCoordinate) // result is in meters
            if  distanceInMeters > 1000 {
                if distanceInMeters > 100000{
                    return "100+ KM"
                }
                return String(format: "%.f", distanceInMeters/1000) + " KM"
            }
            else{
                return String(format: "%.f", distanceInMeters) + " M"
            }
        }
        return "-"
    }
    struct MyIndicator: Indicator {
        let view: UIView = UIView()
        let nav = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30), type: .ballClipRotate, color: .blue, padding: 0.0)
        
        func startAnimatingView() {
            view.isHidden = false
            nav.startAnimating()
            nav.center = view.center
            
            DispatchQueue.main.async {
                self.view.addSubview(self.nav)
            }
        }
        func stopAnimatingView() {
            view.isHidden = true }
        
        init() {
            view.backgroundColor = .white
        }
    }

}
