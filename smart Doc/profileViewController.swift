//
//  profileViewController.swift
//  smart Doc
//
//  Created by Умид Халилов on 01.10.2020.
//  Copyright © 2020 Умид Халилов. All rights reserved.
//

import UIKit

class profileViewController: UIViewController, UIScrollViewDelegate {
    
    
    let profilePageScrollView = UIScrollView()
    let saveButton = UIButton()
    var imageButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Профиль"
        
        profilePageScrollView.delegate = self // подписываемся на делегат
        
        //Set attribute of UIScrollView
//        profilePageScrollView.backgroundColor = UIColor.red
        profilePageScrollView.contentSize.height = 1 * self.view.frame.height
        profilePageScrollView.isPagingEnabled = false
        profilePageScrollView.showsHorizontalScrollIndicator = true
        profilePageScrollView.frame.size = self.view.frame.size
        self.view.addSubview(profilePageScrollView)
        
        profImageAdd()
    
    
    
    }
    
    func profImageAdd()  {
          imageButton = UIButton(type: .custom )
        
        imageButton.frame = CGRect(x: ((profilePageScrollView.frame.size.width / 2) - imageButton.frame.size.width / 2), y: 50, width: (profilePageScrollView.frame.size.width / 2) - 10 , height: profilePageScrollView.frame.size.height / 5)
              imageButton.setBackgroundImage(UIImage(named:"bol v spine.png"), for: .normal)
              
        self.profilePageScrollView.addSubview(imageButton)
    }
    
}
