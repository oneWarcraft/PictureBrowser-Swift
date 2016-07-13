//
//  HomeCollectionViewController.swift
//  PictureBrowser
//
//  Created by 王继伟 on 16/7/14.
//  Copyright © 2016年 WangJiwei. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cellID"

class HomeCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


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
