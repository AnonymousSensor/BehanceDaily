//
//  CollectionInfo.swift
//  BehanceDaily
//
//  Created by chenkai on 2017/4/16.
//  Copyright © 2017年 chenkai. All rights reserved.
//

import Foundation
import ObjectMapper

class CollectionInfo:Mappable {
    var id:String!
    var title:String!
    var owners:[Owner]!
    var stats:CollectionStats!
    
    var images:[String]!
    var createdOn:Int!
    var modifiedOn:Int!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        owners <- map["owners"]
        stats <- map["stats"]
        images <- map["images"]
        createdOn <- map["created_on"]
        modifiedOn <- map["modified_on"]
    }
    
}

class CollectionStats:Mappable{
    var items:Int!
    var followers:Int!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        items <- map["items"]
        followers <- map["followers"]
    }
}
