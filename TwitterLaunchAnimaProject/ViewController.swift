//
//  ViewController.swift
//  TwitterLaunchAnimaProject
//
//  Created by zhifu360 on 2019/5/16.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    lazy var backImgView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "1.jpg"))
        imgView.frame = CGRect(x: 0, y: 0, width: ScreenSize.width, height: ScreenSize.width)
        imgView.center = self.view.center
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "演示"
        
        view.addSubview(backImgView)
    }
    
}

