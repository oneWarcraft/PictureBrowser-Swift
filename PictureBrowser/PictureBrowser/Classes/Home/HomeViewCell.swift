//
//  HomeViewCell.swift
//  PictureBrowser
//
//  Created by 王继伟 on 16/7/14.
//  Copyright © 2016年 WangJiwei. All rights reserved.
//

import UIKit
import SDWebImage

class HomeViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var shop : Shop? {
        didSet {
            // 0. 校验模型是否有值
            guard let shop = shop else {
                return
            }
            
            // 1. 取出图片的 URLString
            guard let url = NSURL(string: shop.q_pic_url) else {
                return
            }
            
            // 2. 设置图片
            let placeHolderImage = UIImage(named: "empty_picture")
            
            imageView.sd_setImageWithURL(url, placeholderImage: placeHolderImage)
            
        }
    }
    
    
}