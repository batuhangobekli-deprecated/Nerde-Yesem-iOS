//
//  NearbyRestaurantCell.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import UIKit

class NearbyRestaurantCell: UICollectionViewCell {
    static let reuseIdentifier = "nearbyRestaurantCell"
    @IBOutlet weak var restaurantThumbnail: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    
    func configure(with viewModel:NearbyRestaurantViewModel)  {
       NerdeYesemUtils.loadImage(resource: restaurantThumbnail, imageURL: viewModel.restaurantThumbnail!, placeHolder: UIImage(named: "logo"), isCircle: false)
        restaurantNameLabel.text = viewModel.restaurantName
    }
}
