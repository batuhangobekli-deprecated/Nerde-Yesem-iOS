//
//  R.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
struct R : Codable {
    let res_id : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case res_id = "res_id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        res_id = try values.decodeIfPresent(Int.self, forKey: .res_id)
    }
    
}
