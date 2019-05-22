//
//  CategoriesViewController.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import UIKit

class CategoriesViewController: BaseViewController,CategoriesView{
   
    
    var presenter:CategoriesPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CategoriesPresenter(categoriesView: self)
        presenter.getCategories()
    }
    func onGetCategories(categories: CategoriesResponse) {
        
    }
}
