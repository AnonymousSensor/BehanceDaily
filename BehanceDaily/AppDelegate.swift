//
//  AppDelegate.swift
//  BehanceDaily
//
//  Created by chenkai on 2017/4/7.
//  Copyright © 2017年 chenkai. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import Moya_ObjectMapper

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let provider = RxMoyaProvider<CreativeCategory>()
        provider.request(.Category).mapObject(CategoryResult.self).subscribe({event in
            switch event{
            case .next(let categoryResult):
                print("Fields总数:\(categoryResult.fields!.count) 第一个Fields名称:\(categoryResult.fields![0].name)")
            case .completed:
                print("categroy done")
            default:
                print("default 1")
            }
        })
        
        provider.request(.InterestedCreative).mapObject(InterestedCreative.self).subscribe({event in
            switch event{
            case .next(let result):
                print("Creatives总数：\(result.creativesToFollow.count) 第一个名称:\(result.creativesToFollow[0].userName)")
            case .completed:
                print("InterestedCreative Done")
            default:
                print("default 2")
            }
        })
        
        //搜索Project接口
        let projectProvider = RxMoyaProvider<Project>()
//        projectProvider.request(.SearchProject(searchText: "design", sort: SearchProjectSortType.FeaturedDate, time: SearchProjectTimeType.All, field: "", country: CountryCodeType.Default, state: "", city: "", page: 0, tags: "", colorHex: "", colorRange: 0, license: "")).mapObject(ProjectInfoResult.self).subscribe({event in
//            switch event{
//            case .next(let result):
//                print("总数\(result.projects.count)")
//            case .completed:
//                print("search project done")
//            default:
//                print("default 3")
//            }
//        })
        
        //查询Project详情接口
        projectProvider.request(.ProjectInfo(projectId: "4889175")).mapObject(ProjectInfoResult.self).subscribe({event in
            switch event{
            case .next(let result):
                print("结果:\(result.project.name)")
            case .completed:
                print("query project info done")
            default:
                print("default 4")
            }
        })
        
        //查询Project评论接口
        projectProvider.request(.ProjectComments(projectId: "4889175")).mapObject(ProjectCommentsResult.self).subscribe({event in
            switch event{
            case .next(let result):
                print("评论总数:\(result.comments.count)")
            case .completed:
                print("query project comment done")
            default:
                print("default 5")
            }
        })
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

