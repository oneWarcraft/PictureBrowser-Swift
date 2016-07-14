//
//  pictureBrowserLayout.swift
//  PictureBrowser
//
//  Created by 王继伟 on 16/7/14.
//  Copyright © 2016年 WangJiwei. All rights reserved.
//

import UIKit

class pictureBrowserLayout: UICollectionViewFlowLayout {
    override func prepareLayout() {
        super.prepareLayout()
        
        // 1. 设置flowLayout的相关属性
        itemSize = UIScreen.mainScreen().bounds.size
        minimumLineSpacing = 0.0
        minimumInteritemSpacing = 0.0
        scrollDirection = .Horizontal
        
        // 2. 设置collectionView的相关属性
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.pagingEnabled = true
        
    }
}

