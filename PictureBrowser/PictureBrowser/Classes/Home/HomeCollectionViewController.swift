//
//  HomeCollectionViewController.swift
//  PictureBrowser
//
//  Created by 王继伟 on 16/7/14.
//  Copyright © 2016年 WangJiwei. All rights reserved.
//

import UIKit
import AFNetworking


private let reuseIdentifier = "Cell"

class HomeCollectionViewController: UICollectionViewController
{
    lazy var shops : [Shop] = [Shop]()
    
//    var isPresented : Bool  = false
    
    lazy var pictureBrowserAnimator : PictureBrowserAnimator = PictureBrowserAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData(0)
    }

}

extension HomeCollectionViewController
{
    func loadData(offset: Int) {
        // 发送网络请求
        NetworkTools.shareInstance.loadHomeData(offset) { (resultArray, error) in
            // 1. 错误校验
            if error != nil {
                return
            }
            
            // 2. 取出可选类型中的数据
            guard let resultArray = resultArray else {
                return
            }
            
            // 3. 遍历数组,将数据中的字典转换成模型对象
            for dict in resultArray {
                let shop = Shop(dict: dict)
                self.shops.append(shop)
            }
            
            // 4. 刷新表格
            self.collectionView?.reloadData()
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
        return self.shops.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // "HomeCell" cell ID
        let cell = collectionView .dequeueReusableCellWithReuseIdentifier("HomeCell", forIndexPath: indexPath) as! HomeViewCell
        
//        cell.backgroundColor = UIColor.redColor()
        
        cell.shop = shops[indexPath.row]
        
        if indexPath.row == shops.count - 1 {
            loadData(shops.count)
        }
        
        return cell
    }
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        // 1. 创建图片浏览器控制器
        let pictureBrowser = PictureBrowserController()
        
        // 2. 设置控制器相关属性
        pictureBrowser.indexPath = indexPath
        pictureBrowser.shops = shops
        pictureBrowserAnimator.indexPath = indexPath
        pictureBrowserAnimator.presentedDelegate = self
        pictureBrowserAnimator.dismissDelegate = pictureBrowser
        
//  3      pictureBrowser.modalTransitionStyle = .PartialCurl
        pictureBrowser.modalPresentationStyle = .Custom
        pictureBrowser.transitioningDelegate = pictureBrowserAnimator
    
        // 4. 弹出控制器
        presentViewController(pictureBrowser, animated: true, completion: nil)
        
    }
}

// MARK:- 实现presentedDelegate的代理方法
extension HomeCollectionViewController : PresentedProtocol {
    func getImageView(indexPath: NSIndexPath) -> UIImageView {
        // 1. 创建UIImageView对象
        let imageView = UIImageView()
        
        // 2. 设置图片
        let cell = collectionView?.cellForItemAtIndexPath(indexPath) as! HomeViewCell
        imageView.image = cell.imageView.image
        
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }
    
    func getStartRect(indexPath: NSIndexPath) -> CGRect {
        
        guard let cell = collectionView?.cellForItemAtIndexPath(indexPath) as?  HomeViewCell else {
            return CGRectZero
        }
        
        // 将cell的frame转换成所有屏幕的frame
        let startRect = collectionView!.convertRect(cell.frame, toCoordinateSpace: UIApplication.sharedApplication().keyWindow!)
        
        return startRect
    }
    
    func getEndRect(indexPath: NSIndexPath) -> CGRect {
        //获取当前正在现实的cell
        let cell = collectionView?.cellForItemAtIndexPath(indexPath) as! HomeViewCell
        
        // 获取image对象
        let image = cell.imageView.image
        return calculateImageViewFrame(image!)
        
    }
}














