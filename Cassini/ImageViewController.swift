//
//  ImageViewController.swift
//  Cassini
//
//  Created by ying on 16/2/29.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var imageURL: NSURL? {
        didSet {
            image = nil
            //判断当前视图是否在街面上
            if view.window != nil
            {
                fetchImage()
            }
        }
    }
    
    private func fetchImage()
    {
        if let url = imageURL {
            let imageData = NSData(contentsOfURL: url)
            if imageData != nil {
                image = UIImage(data: imageData!)
            }
            else
            {
                image = nil
            }
            
        }
    }

    private var imageView = UIImageView()
    
    private var image: UIImage? {
        
        get {
            return imageView.image
        }
        
        set {
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        view.addSubview(imageView)
        if image == nil
        {
            imageURL = DemoURL.Stanford
        }
    }
    
    //此处开始下载图片
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if image == nil
        {
           fetchImage()
        }
    }
    

}
