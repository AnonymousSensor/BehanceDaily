//
//  ProjectEngine.swift
//  BehanceDaily
//
//  Created by chenkai on 2017/4/7.
//  Copyright © 2017年 chenkai. All rights reserved.
//

import Foundation
import Moya

enum SearchProjectSortType: String{
    case FeaturedDate = "featured_date"
    case Appreciations = "appreciations"
    case Views = "views"
    case Comments = "comments"
    case PublishedDate = "published_date"
}

enum SearchProjectTimeType: String{
    case All = "all"
    case Today = "today"
    case Week = "week"
    case Month = "month"
}

/*
      Mark - 搜索Project接口参数说明
 */
/// - parameter searchText: 搜索Project字符串
/// - parameter sort: 搜索结果排序类型
/// - parameter time: 搜索结果时间周期 (all - 全部，today - 今天，week - 本周，month - 本月)
/// - parameter field: 搜索Project分类Category类型名称 (数据来自类型接口)
/// - parameter country: 国家的两位FIPS代码 
/// - parameter state: 国家下面州或省份名称
/// - parameter city: 城市名称
/// - parameter page: 分页页数
/// - parameter tags: 标签 (单个 - 标签名， 多个 - 标签名按照|分隔字符串)
/// - parameter colorHex: 颜色的Hex值 (剔除#前缀)
/// - parameter colorRange: 颜色区间值 (default - 20 值区间:0 - 255)
/// - parameter license: 授权 (通过Creative License过滤 - 未知)


enum Project{
    case SearchProject(searchText:String,sort:SearchProjectSortType,time:SearchProjectTimeType,field:String,country:CountryCodeType,state:String,city:String,page:Int,tags:String,colorHex:String,colorRange:Int,license:String)
}

extension Project: TargetType{
    var baseURL: URL{return URL(string:BEHANCE_URL)!}
    var path: String{
        switch self {
        case .SearchProject:
            return BEHANCE_URL_SEARCH_PROJECT
        }
    }
    
    var method: Moya.Method{
        switch self {
        case .SearchProject:
            return .get
        }
    }
    
    var parameters: [String : Any]?{
        switch self {
        case .SearchProject(let searchText,let sortType,let timeType,let field,let countryType,let state,let city,let page,let tags,let colorHex,let colorRange,let license):
            return [BEHANCE_ARGUMENT_SEARCH_PROJECT_Q:searchText,
                    BEHANCE_ARGUMENT_SEARCH_PROJECT_SORT:sortType.rawValue,
                    BEHANCE_ARGUMENT_SEARCH_PROJECT_TIME:timeType.rawValue,
                    BEHANCE_ARGUMENT_SEARCH_PROJECT_FIELD:field,
                    BEHANCE_ARGUMENT_SEARCH_PROJECT_COUNTRY:countryType.rawValue,
                    BEHANCE_ARGUMENT_SEARCH_PROJECT_STATE:state,
                    BEHANCE_ARGUMENT_SEARCH_PROJECT_CITY:city,
                    BEHANCE_ARGUMENT_SEARCH_PROJECT_PAGE:page,
                    BEHACNE_ARGUMENT_SEARCH_PROJECT_TAGS:tags,
                    BEHANCE_ARGUMENT_SEARCH_PROJECT_COLOR_HEX:colorHex,
                    BEHANCE_ARGUMENT_SEARCH_PROJECT_COLOR_RANGE:colorRange,
                    BEHANCE_ARGUMENT_SEARCH_PROJECT_COLOR_LICESE:license,
                    BEHANCE_ARGUMENT_CLIENT_ID:BEHANCE_APP_KEY]
        }
    }
    
    var parameterEncoding: ParameterEncoding{
        switch self {
        case .SearchProject:
            return URLEncoding.default
        }
    }
    
    var sampleData: Data{
        switch self {
        case .SearchProject:
            return "".data(using: String.Encoding.utf8)!
        }
    }
    
    var task: Task{
        switch self {
        case .SearchProject:
            return .request
        }
    }
}

