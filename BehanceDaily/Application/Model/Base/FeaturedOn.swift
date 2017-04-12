//
//  FeaturedOn.swift
//  BehanceDaily
//
//  Created by chenkai on 2017/4/12.
//  Copyright © 2017年 chenkai. All rights reserved.
//

import Foundation
import ObjectMapper

class FeaturedOn: Mappable {
    var site:String!
    var timeStamp:Int! //不知道是否覆盖时间戳边界 Int类型
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        site <- map["site"]
        timeStamp <- map["timestamp"]
    }
}
