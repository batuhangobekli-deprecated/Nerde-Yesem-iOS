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
