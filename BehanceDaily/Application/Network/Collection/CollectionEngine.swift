//
//  CollectionEngine.swift
//  BehanceDaily
//
//  Created by chenkai on 2017/4/16.
//  Copyright © 2017年 chenkai. All rights reserved.
//

import Foundation
import Moya

enum Collection{
    case SearchCollections(searchText:String,time:SearchCollectionTimeType,page:Int,sort:SearchCollectionSortType)
}

enum SearchCollectionTimeType: String {
    case All = "all"
    case Today = "today"
    case Week = "week"
    case Month = "month"
}

enum SearchCollectionSortType: String {
    case Comments = "comments"
    case Views = "views"
    case LastItemAddedDate = "last_item_added_date"
}

extension Collection:TargetType{
    var baseURL: URL{return URL(string:BEHANCE_URL)!}
    var path: String{
        switch self {
        case .SearchCollections:
            return BEHANCE_URL_SEARCH_COLLECTION;
        }
    }
    
    var method: Moya.Method{
        switch self {
        case .SearchCollections:
            return .get
        }
    }
    
    var parameters: [String : Any]?{
        switch self {
        case .SearchCollections(let searchText, let time, let page, let sort):
            return [BEHANCE_ARGUMENT_SEARCH_COLLECTION_Q:searchText,
                    BEHANCE_ARGUMENT_SEARCH_COLLECTION_TIME:time.rawValue,
                    BEHANCE_ARGUMENT_SEARCH_COLLECTION_PAGE:page,
                    BEHANCE_ARGUMENT_SEARCH_COLLECTION_SORT:sort.rawValue,
                    BEHANCE_ARGUMENT_APP_KEY:BEHANCE_APP_KEY]
        }
    }
    
    var parameterEncoding: ParameterEncoding{
        switch self {
        case .SearchCollections:
            return URLEncoding.default
        }
    }
    
    var sampleData: Data{
        switch self {
        case .SearchCollections:
            return "".data(using: String.Encoding.utf8)!
        }
    }
    
    var task: Task{
        switch self {
        case .SearchCollections:
            return .request
        }
    }
}
