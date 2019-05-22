//
//  CategoriesViewController.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import UIKit

class CategoriesViewController: BaseViewController,CategoriesView{
    @IBOutlet weak var categoriesTableView: UITableView!
    var presenter:CategoriesPresenter!
    var dataSource = CategoriesDataSource(categories: [])
    
    override func viewDidLoad() {
        self.isLogoEnabled = true
        super.viewDidLoad()
        categoriesTableView.dataSource = dataSource
        categoriesTableView.delegate = dataSource
        presenter = CategoriesPresenter(categoriesView: self)
        presenter.getCategories()
    }
    func onGetCategories(categories: CategoriesResponse) {
        dataSource.update(with: categories.categories!)
        categoriesTableView.reloadData()
    }
}
