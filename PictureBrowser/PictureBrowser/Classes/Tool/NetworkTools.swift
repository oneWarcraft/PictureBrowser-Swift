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
    
    
    func loadHomeData(finishedCallBack: (resultArray : [[String : NSObject]], error : NSError) -> ()) {
        // 1. 获取请求的URL
        let urlString = "http://mobapi.meilishuo.com/2.0/twitter/popular.json?offset=0&limit=30&access_token=b92e0c6fd3ca919d3e7547d446d9a8c2"
        
        // 2. 发送网络请求
        GET(urlString, parameters: nil, progress: nil, success: { (_, result) in
            print(result)
            }) { (_, error) in
                print(error)
        }
    }
    
    
    
    
}

