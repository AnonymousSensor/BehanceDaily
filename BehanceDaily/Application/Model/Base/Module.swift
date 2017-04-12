//
//  Module.swift
//  BehanceDaily
//
//  Created by chenkai on 2017/4/12.
//  Copyright © 2017年 chenkai. All rights reserved.
//

import Foundation
import ObjectMapper

class Module:Mappable{
    var type:String! //三种类型image、text、embed
    var src:String!
    var width:Int!
    var height:Int!
    var text:String!
    var textPlain:String!
    var embed:String!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        type <- map["type"]
        src <- map["src"]
        width <- map["width"]
        height <- map["height"]
        text <- map["text"]
        textPlain <- map["text_plain"]
        embed <- map["embed"]
    }
}
