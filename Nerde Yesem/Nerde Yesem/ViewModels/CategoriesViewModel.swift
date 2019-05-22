//
//  CategoriesViewModel.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
import UIKit

struct CategoriesViewModel {
    let categoryName: String?
    let categoryColor:UIColor?
}

extension CategoriesViewModel {
    init(category:Category) {
        categoryName = category.categories?.name
        categoryColor = UIColor.random
    }
}
