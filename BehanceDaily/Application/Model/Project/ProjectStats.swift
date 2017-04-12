//
//  ProjectStats.swift
//  BehanceDaily
//
//  Created by chenkai on 2017/4/7.
//  Copyright © 2017年 chenkai. All rights reserved.
//

import Foundation
import ObjectMapper

class ProjectStats:Mappable{
    var views:Int!
    var appreciations:Int!
    var comments:Int!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        views <- map["views"]
        appreciations <- map["appreciations"]
        comments <- map["comments"]
    }
}
