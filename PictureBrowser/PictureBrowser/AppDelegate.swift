//
//  AppDelegate.swift
//  PictureBrowser
//
//  Created by 王继伟 on 16/7/14.
//  Copyright © 2016年 WangJiwei. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}

// MARK:- 根据图片计算imageView的frame
func calculateImageViewFrame(image : UIImage) -> CGRect {
    let imageViewW = UIScreen.mainScreen().bounds.width
    let imageViewH = imageViewW / image.size.width * image.size.height
    let x : CGFloat = 0
    let y = (UIScreen.mainScreen().bounds.height - imageViewH) * 0.5
    
    return CGRect(x: x, y: y, width: imageViewW, height: imageViewH)
}

