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
    
    lazy var collectionView : UICollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
    lazy var closeBtn : UIButton = UIButton()
    lazy var saveBtn : UIButton = UIButton()
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.purpleColor()
        
        setupUI()
    }
    
}

extension PictureBrowserController
{
    func setupUI() {
        // 1. 添加子控件
        view.addSubview(collectionView)
        view.addSubview(closeBtn)
        view.addSubview(saveBtn)
        
        // 2. 设置子控件的位置
        collectionView.frame = view.bounds
        let margin : CGFloat = 20
        let btnW : CGFloat = 90
        let btnH : CGFloat = 32
        let y : CGFloat = UIScreen.mainScreen().bounds.height - margin - btnH
        closeBtn.frame = CGRect(x: margin, y: y, width: btnW, height: btnH)
        let x : CGFloat = UIScreen.mainScreen().bounds.width - margin - btnW
        saveBtn.frame = CGRect(x: x, y: y, width: btnW, height: btnH)
        
        // 3. 设置btn的相关属性
        prepareBTN()
        
        // 4. 设置CollectionView的相关属性
        prepareCollectionView()
    }
    
    func prepareBTN() {
        
    }
    
    func prepareCollectionView() {
        
    }
}














