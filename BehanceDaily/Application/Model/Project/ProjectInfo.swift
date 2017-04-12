//
//  ProjectInfo.swift
//  BehanceDaily
//
//  Created by chenkai on 2017/4/7.
//  Copyright © 2017年 chenkai. All rights reserved.
//

import Foundation
import ObjectMapper

class ProjectInfo:Mappable{
    var id:Int!
    var name:String!
    var publishedOn:Int!
    var createdOn:Int!
    var modifiedOn:Int!
    var url:String!
    var fields:[String]!
    var covers:[String:String]!
    
    var matureContent:Int!
    var owners:[String:Owner]!
    var stats:ProjectStats!
    var description:String!
    var modules:[Module]!
    var copyRight:CopyRight!
    var featuredOn:FeaturedOn!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        publishedOn <- map["published_on"]
        createdOn <- map["created_on"]
        modifiedOn <- map["modified_on"]
        
        url <- map["url"]
        fields <- map["fields"]
        covers <- map["covers"]
        matureContent <- map["mature_content"]
        owners <- map["owners"]
        stats <- map["stats"]
        description <- map["description"]
        modules <- map["modules"]
        copyRight <- map["copyright"]
        featuredOn <- map["featured_on"]
    }
}

class ProjectInfoResult:Mappable{
    var projects:[ProjectInfo]!//搜索Project
    var project:ProjectInfo!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
       projects <- map["projects"]
       project <- map["project"]
    }
}
