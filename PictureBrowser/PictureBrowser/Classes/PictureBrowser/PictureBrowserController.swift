//
//  PictureBrowserController.swift
//  PictureBrowser
//
//  Created by 王继伟 on 16/7/14.
//  Copyright © 2016年 WangJiwei. All rights reserved.
//
//
import UIKit

class PictureBrowserController: UIViewController {
    // MARK: - 定义的属性
    var indexPath : NSIndexPath?
    var shops : [Shop]?
    let pictureBrowseCellID = "pictureBrowseCellID"
    
    
    lazy var collectionView : UICollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: pictureBrowserLayout())

    lazy var closeBtn : UIButton = UIButton()
    lazy var saveBtn : UIButton = UIButton()
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        

        view.frame.size.width += 15
        // 1.设置UI界面
        setupUI()
        
        // 2.滚动到对应的位置
        collectionView.scrollToItemAtIndexPath(indexPath!, atScrollPosition: .Left, animated: false)
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
        setupBtn(closeBtn, title: "关 闭", action: "closeBtnClick")
        setupBtn(saveBtn, title: "保 存", action: "saveBtnClick")
    }
    
    func setupBtn(btn : UIButton, title : String, action : String) {
        btn.setTitle(title, forState: .Normal)
        btn.backgroundColor = UIColor.darkGrayColor()
        btn.titleLabel?.font = UIFont.systemFontOfSize(14.0)
        btn.addTarget(self, action: Selector(action), forControlEvents: .TouchUpInside)
    }
    
    
    func prepareCollectionView()
    {
        collectionView.dataSource = self

        collectionView.delegate = self
        
        collectionView.registerClass(PictureBrowserViewCell.self, forCellWithReuseIdentifier: pictureBrowseCellID)
    }
}

extension PictureBrowserController {
    @objc private func closeBtnClick() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @objc private func saveBtnClick() {
        // 1. 取出当前正在显示的图片
        let cell = collectionView.visibleCells().first as! PictureBrowserViewCell
        guard let image = cell.imageView.image else {
            return
        }
        
        // 2. 保存图片
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
    }
}

// MARK:- collectionView的数据源和代理方法
extension PictureBrowserController :UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shops?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // 1.创建cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(pictureBrowseCellID, forIndexPath: indexPath) as! PictureBrowserViewCell
        
        // 2.设置cell的内容
//        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.redColor() : UIColor.blueColor()
        
        cell.shop = shops![indexPath.item]

        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        closeBtnClick()
    }
}

// MARK:- 实现dismissProtocol的代理方法
extension PictureBrowserController : DismissProtocol {
    
    func getImageView() -> UIImageView {
        // 1. 创建UIImageView对象
        let imageView = UIImageView()
        
        // 2. 设置imageView的image
        let cell = collectionView.visibleCells().first as! PictureBrowserViewCell
	imageView.image = cell.imageView.image
        
        // 3. 设置imageView的frame
        imageView.frame = cell.imageView.frame
        
        // 4. 设置imageView的属性
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }
    
    func getIndexPath() -> NSIndexPath {
        // 获取正在显示的Cell
        let cell = collectionView.visibleCells().first as! PictureBrowserViewCell
        
        return  collectionView.indexPathForCell(cell)!
    }
}












