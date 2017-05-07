//
//  Albums.swift
//  haroldo
//
//  Created by Mateus Pinheiro on 25/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Album: Object, Mappable {
    dynamic var userId = 0
    dynamic var id = 0
    dynamic var title = ""
    dynamic var cover = ""
    
    override static func primaryKey() -> String? { return "id" }
    
    required convenience init?(map: Map) {
       self.init()
    }
    
    func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
    }
}
