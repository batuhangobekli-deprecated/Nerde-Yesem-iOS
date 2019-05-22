//
//  CategoriesPresenter.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
import Alamofire

class CategoriesPresenter {
    private var categoriesView:CategoriesView!
    
    init(categoriesView:CategoriesView) {
        self.categoriesView = categoriesView
    }
         func getCategories() {
            AF.request(APIRouter.categories)
                .responseDecodable { (response: DataResponse<CategoriesResponse>) in
                    switch response.result {
                    case .success(let categories):
                        self.categoriesView.onGetCategories(categories:categories)
                    case .failure(let error):
                        break
                    }
            }
        }
}
