//
//  LoginViewController.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 24.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateUser()
    }
    @IBAction func onRetryAuthButtonTap(_ sender: Any) {
        authenticateUser()
    }
    func authenticateUser(){
        BioMetricAuthenticator.authenticateWithBioMetrics(reason: "Lütfen giriş için FaceID veya Parmak İzi kullanın") { [weak self] (result) in
            switch result {
            case .success( _):
                self?.performSegue(withIdentifier: "showMainController", sender: nil)
            case .failure(let error):
                print("Error")
            }
        }
    }
}


