//
//  CopyRight.swift
//  BehanceDaily
//
//  Created by chenkai on 2017/4/12.
//  Copyright © 2017年 chenkai. All rights reserved.
//

import Foundation
import ObjectMapper

class CopyRight: Mappable {
    var license:String!
    var description:String!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        license <- map["license"]
        description <- map["description"]
    }
}
