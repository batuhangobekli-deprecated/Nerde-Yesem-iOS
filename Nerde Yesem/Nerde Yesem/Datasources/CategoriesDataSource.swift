//
//  CategoriesDataSource.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
import UIKit

class CategoriesDataSource:NSObject,UITableViewDataSource,UITableViewDelegate{
    private var categories = [Category]()
    
    init(categories:[Category]) {
        self.categories = categories
        super.init()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesCell.reuseIdentifier, for: indexPath) as! CategoriesCell
        let category = categories[indexPath.row]
        let viewModel = CategoriesViewModel(category: category)
        cell.configure(with: viewModel)
        return cell
    }
    func update(with categories: [Category]) {
        self.categories = categories
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0

    }
    
}
