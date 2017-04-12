//
//  ProjectComment.swift
//  BehanceDaily
//
//  Created by chenkai on 2017/4/12.
//  Copyright © 2017年 chenkai. All rights reserved.
//

import Foundation
import ObjectMapper

class ProjectComment: Mappable {
    var user:Owner!
    var comment:String!
    var createdOn:Int!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        user <- map["user"]
        comment <- map["comment"]
        createdOn <- map["created_on"]
    }
}

class ProjectCommentsResult: Mappable {
    var comments:[ProjectComment]!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        comments <- map["comments"]
    }
}
