//
//  PictureBrowserController.swift
//  PictureBrowser
//
//  Created by 王继伟 on 16/7/14.
//  Copyright © 2016年 WangJiwei. All rights reserved.
//

import UIKit

class PictureBrowserController: UIViewController {
    // MARK: - 定义的属性
    var indexPath : NSIndexPath?
    var shops : [Shop]?
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.purpleColor()
    }
    
    
    
}
