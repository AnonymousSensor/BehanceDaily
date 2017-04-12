//
//  Owner.swift
//  BehanceDaily
//
//  Created by chenkai on 2017/4/7.
//  Copyright © 2017年 chenkai. All rights reserved.
//

import Foundation
import ObjectMapper

class Owner: Mappable {
    var id:Int!
    var firstName:String!
    var lastName:String!
    var userName:String!
    var city:String!
    
    var state:String!
    var country:String!
    var company:String!
    var occupation:String!
    var createdOn:String!
    
    var url:String!
    var displayName:String!
    var images:[String:String]!
    var fields:[String]!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        userName <- map["username"]
        city <- map["city"]
        state <- map["state"]
        country <- map["country"]
        company <- map["company"]
        occupation <- map["occupation"]
        createdOn <- map["created_on"]
        url <- map["url"]
        displayName <- map["display_name"]
        images <- map["images"]
        fields <- map["fields"]
    }
}
