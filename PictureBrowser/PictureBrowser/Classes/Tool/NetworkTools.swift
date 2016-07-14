//
//  NetworkTools.swift
//  PictureBrowser
//
//  Created by 王继伟 on 16/7/14.
//  Copyright © 2016年 WangJiwei. All rights reserved.
//

import Foundation
import AFNetworking

class NetworkTools: AFHTTPSessionManager {
    // 将类设计成单粒对象
    static let shareInstance : NetworkTools = {
        let tool = NetworkTools()
        tool.responseSerializer.acceptableContentTypes?.insert("text/html")
        
        return tool
    }()
    
    
    func loadHomeData(offset: Int, finishedCallBack: (resultArray : [[String : NSObject]]?, error : NSError?) -> ()) {
        // 1. 获取请求的URL
        let urlString = "http://mobapi.meilishuo.com/2.0/twitter/popular.json?offset=\(offset)&limit=30&access_token=b92e0c6fd3ca919d3e7547d446d9a8c2"
        
        // 2. 发送网络请求
        GET(urlString, parameters: nil, progress: nil, success: { (_, result) in
            
            // 1.将Anyobject?转换成字典类型
            guard let resultDict = result as? [String : NSObject] else {
                print("没有拿到正确的数据")
                return
            }
            
            // 2. 从字典中将数组取出
            let dictArray = resultDict["data"] as? [[String : NSObject]]
            
            // 3. 将数据回调出去
            finishedCallBack(resultArray: dictArray, error: nil)
            
//            print(result)
            }) { (_, error) in
//                print(error)
                finishedCallBack(resultArray: nil, error: error)
        }
    }
}

