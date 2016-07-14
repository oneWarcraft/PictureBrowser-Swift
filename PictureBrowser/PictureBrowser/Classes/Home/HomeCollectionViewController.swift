//
//  HomeCollectionViewController.swift
//  PictureBrowser
//
//  Created by 王继伟 on 16/7/14.
//  Copyright © 2016年 WangJiwei. All rights reserved.
//

import UIKit
import AFNetworking


private let reuseIdentifier = "cellID"

class HomeCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 发送网络请求
        NetworkTools.shareInstance.loadHomeData { (resultArray, error) in
            
        }
        
        
    }


}

/*
//原则上不要在extension里override方法
extension NSMutableArray {
    
    public override func descriptionWithLocale(locale: AnyObject?) -> String {
        var str = "(\n"
        
        [self .enumerateObjectsUsingBlock({
            str += "\t\($0.0), \n"
        })]
        
        str += ")"
        
        return str
    }
}
*/

extension HomeCollectionViewController {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // "HomeCell" cell ID
        let cell = collectionView .dequeueReusableCellWithReuseIdentifier("HomeCell", forIndexPath: indexPath)
        
        cell.backgroundColor = UIColor.redColor()
        
        return cell
        
    }
    
}
