//
//  CreativeCategoryEngine.swift
//  BehanceDaily
//
//  Created by chenkai on 2017/4/7.
//  Copyright © 2017年 chenkai. All rights reserved.
//

import Foundation
import Moya

enum CreativeCategory{
    case Category
}

extension CreativeCategory: TargetType{
    var baseURL: URL {return URL(string:BEHANCE_URL)!}
    var path: String{
        switch self {
        case .Category:
            return BEHANCE_URL_CATEGORY
        }
    }
    
    var method: Moya.Method{
        switch self {
        case .Category:
            return .get
        }
    }
    
    var parameters: [String : Any]?{
        switch self {
        case .Category:
            return [BEHANCE_ARGUMENT_CLIENT_ID:BEHANCE_APP_KEY]
        }
    }
    
    var parameterEncoding: ParameterEncoding{
        switch self {
        case .Category:
            return URLEncoding.default
        }
    }
    
    var sampleData: Data{
        switch self {
        case .Category:
            return "".data(using: String.Encoding.utf8)!
        }
    }
    
    var task: Task{
        switch self {
        case .Category:
            return .request
        }
    }
}
