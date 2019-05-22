//
//  Categories.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
struct Categories : Codable {
    let id:Int?
    let name:String?
   
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}
