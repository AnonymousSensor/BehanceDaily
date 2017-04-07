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
    case InterestedCreative
}

extension CreativeCategory: TargetType{
    var baseURL: URL {return URL(string:BEHANCE_URL)!}
    var path: String{
        switch self {
        case .Category:
            return BEHANCE_URL_CATEGORY
        case .InterestedCreative:
            return BEHANCE_URL_INTERESTED_CREATIVE
        }
    }
    
    var method: Moya.Method{
        switch self {
        case .Category,.InterestedCreative:
            return .get
        }
    }
    
    var parameters: [String : Any]?{
        switch self {
        case .Category,.InterestedCreative:
            return [BEHANCE_ARGUMENT_CLIENT_ID:BEHANCE_APP_KEY]
        }
    }
    
    var parameterEncoding: ParameterEncoding{
        switch self {
        case .Category,.InterestedCreative:
            return URLEncoding.default
        }
    }
    
    var sampleData: Data{
        switch self {
        case .Category,.InterestedCreative:
            return "".data(using: String.Encoding.utf8)!
        }
    }
    
    var task: Task{
        switch self {
        case .Category,.InterestedCreative:
            return .request
        }
    }
}
