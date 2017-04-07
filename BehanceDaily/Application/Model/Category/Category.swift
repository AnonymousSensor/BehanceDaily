//
//  Category.swift
//  BehanceDaily
//
//  Created by chenkai on 2017/4/7.
//  Copyright © 2017年 chenkai. All rights reserved.
//

import Foundation
import ObjectMapper

class Category: Mappable {
    var id:Int!
    var name:String!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}

class CategoryResult: Mappable {
    var fields:[Category]!
    var popular:[Category]!
    var http_code:Int!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        fields <- map["fields"]
        popular <- map["popular"]
        http_code <- map["http_code"]
    }
}
