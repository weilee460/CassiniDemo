//
//  ImageViewController.swift
//  Cassini
//
//  Created by ying on 16/2/29.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
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
            spinner?.startAnimating()
            
            let qos = Int(QOS_CLASS_USER_INITIATED.rawValue)
            
            dispatch_async(dispatch_get_global_queue(qos, 0)){ () -> Void in
                let imageData = NSData(contentsOfURL: url)
                //UI operation need put main queue
                dispatch_async(dispatch_get_main_queue()){
                    //judge url of returned image is or not we quest
                    if url == self.imageURL
                    {
                        if imageData != nil {
                            self.image = UIImage(data: imageData!)
                        }
                        else
                        {
                            self.image = nil
                        }
                    }
                }
                
                
            }
            
        }
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            //magic number, :-)
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    //ScollView delegate func
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return imageView
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        
        get {
            return imageView.image
        }
        
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            //set scrollview contentsize, must set. below ?, for some security reason
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        scrollView.addSubview(imageView)

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
