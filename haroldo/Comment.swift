//
//  Comment.swift
//  haroldo
//
//  Created by Mateus Pinheiro on 25/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import ObjectMapper

class Comment: Mappable {
    dynamic var id = 0
    dynamic var postId = 0
    dynamic var name = ""
    dynamic var email = ""
    dynamic var body = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        postId <- map["postId"]
        name <- map["name"]
        email <- map["email"]
        body <- map["body"]
    }
}
