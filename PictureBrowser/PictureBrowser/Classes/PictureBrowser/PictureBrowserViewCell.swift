//
//  PictureBrowserViewCell.swift
//  PictureBrowser
//
//  Created by 王继伟 on 16/7/14.
//  Copyright © 2016年 WangJiwei. All rights reserved.
//

import UIKit
import SDWebImage

class PictureBrowserViewCell: UICollectionViewCell {
    
    // MARK:- 懒加载属性
    lazy var imageView : UIImageView = UIImageView()
    
    // MARK:- 定义属性
    var shop : Shop? {
        didSet {
            // 1. nil值校验
            guard let shop = shop else {
                return
            }
            
            // 2. 取出image对象
            var image = SDWebImageManager.sharedManager().imageCache.imageFromMemoryCacheForKey(shop.q_pic_url)
            
            if image == nil {
                image = UIImage(named: "empty_picture")
            }
            
            // 3. 根据图片计算imageView的frame
            imageView.frame = calculateImageViewFrame(image)
            
            // 4. 设置imageView的图片
            guard let url = NSURL(string: shop.z_pic_url) else {
                imageView.image = image
                return
            }
            
            imageView.sd_setImageWithURL(url, placeholderImage: image) { (image, _, _, __) -> Void
                in
                self.imageView.frame = self.calculateImageViewFrame(image)
            }

        }
    }
    
    // MARK:- 构造函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        contentView.addSubview(imageView)
    }
}

extension PictureBrowserViewCell {
    // MARK:- 根据图片计算imageView的frame
    func calculateImageViewFrame(image : UIImage) -> CGRect {
        let imageViewW = UIScreen.mainScreen().bounds.width
        let imageViewH = imageViewW / image.size.width * image.size.height
        let x : CGFloat = 0
        let y = (UIScreen.mainScreen().bounds.height - imageViewH) * 0.5
        
        return CGRect(x: x, y: y, width: imageViewW, height: imageViewH)
    }
}


