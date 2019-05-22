//
//  BaseViewController.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController{
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var isLogoEnabled = false
    var statusBarHidden: Bool = false { didSet { setNeedsStatusBarAppearanceUpdate() } }
    var statusBarStyle: UIStatusBarStyle = .lightContent { didSet { setNeedsStatusBarAppearanceUpdate() } }
    var statusBarUpdateAnimation: UIStatusBarAnimation = .fade { didSet { setNeedsStatusBarAppearanceUpdate() } }
    override var preferredStatusBarStyle: UIStatusBarStyle { return statusBarStyle }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation { return statusBarUpdateAnimation }
    override var prefersStatusBarHidden: Bool { return statusBarHidden }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isLogoEnabled {
            configureTitleView()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let navigationBarAppearace = UINavigationBar.appearance()
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationBarAppearace.titleTextAttributes = textAttributes
    }
    func configureTitleView(){
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        let titleImageView = UIImageView(image: UIImage(named: "logo"))
        titleImageView.contentMode = .scaleAspectFit
        titleImageView.frame = CGRect(x: 0, y: 0, width: titleView.frame.width, height: titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
}

