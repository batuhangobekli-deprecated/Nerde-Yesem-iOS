//
//  CategoriesCell.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import UIKit

class CategoriesCell: UITableViewCell {
    static let reuseIdentifier = "eventMenuCell"
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryThumbail: UIImageView!
    
    func configure(with viewModel:CategoriesViewModel)  {
        categoryName.text = viewModel.categoryName
        categoryThumbail.backgroundColor = viewModel.categoryColor
    }
}
