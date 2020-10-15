//
//  menuViewController.swift
//  smart Doc
//
//  Created by Умид Халилов on 01.10.2020.
//  Copyright © 2020 Умид Халилов. All rights reserved.
//

import UIKit

class menuViewController: UIViewController, UIScrollViewDelegate {
    
    
    var menuPageScrollView = UIScrollView()
    
    var button1 = UIButton()
    var button2 = UIButton()
    var button3 = UIButton()
    var button4 = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Тема для обращения"
//        self.menuPageScrollView.backgroundColor = UIColor.red
        //        let scrollViewRec = self.view.bounds // показываем что все страницы будут одинаковые
        
        menuPageScrollView.delegate = self // подписываемся на делегат
        
        //Set attribute of UIScrollView
        menuPageScrollView.contentSize.height = 1 * self.view.frame.height
        menuPageScrollView.isPagingEnabled = false
        menuPageScrollView.showsHorizontalScrollIndicator = true
        menuPageScrollView.frame.size = self.view.frame.size
        self.view.addSubview(menuPageScrollView)
        
        
        buttonHarakter()
        
        
    }
    
    //MARK: Действие кнопки
    @objc func buttonAction(sender: UIButton!) {
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    func addButton(button: UIButton) {
//        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 3
        
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = button.frame.size.width / 10
        button.addTarget(self, action: #selector(buttonAction),  for: .touchUpInside)
        self.menuPageScrollView.addSubview(button)
    }
    func buttonHarakter()  {
        // добавление кнопки 1
        button1 = UIButton(type: .custom )
        button1.frame = CGRect(x: 10  , y: 20, width: (menuPageScrollView.frame.size.width / 2) - 10 , height: menuPageScrollView.frame.size.height / 5)
        button1.setBackgroundImage(UIImage(named:"bol v spine.png"), for: .normal)
        button1.setTitle("Боль в спине", for: .normal)
        addButton(button: button1)
        
        
        // добавление кнопки 2
        button2 = UIButton(type: .custom )
        button2.frame = CGRect(x: button1.frame.size.width + 20  , y: 20, width: (menuPageScrollView.frame.size.width / 2) - 20, height: menuPageScrollView.frame.size.height / 5)
        button2.setTitle("Вторая", for: .normal)
        button2.setBackgroundImage(UIImage(named:"golovnaya bol"), for: .normal)
        
        addButton(button: button2)
        
        
        // добавление кнопки 3
        button3 = UIButton(type: .custom )
        button3.frame = CGRect(x: 10  , y: button1.frame.size.height + 30, width: (menuPageScrollView.frame.size.width / 2) - 10 , height: menuPageScrollView.frame.size.height / 5)
        button3.setTitle("Третья", for: .normal)
        button3.setBackgroundImage(UIImage(named:"gorlo"), for: .normal)
        addButton(button: button3)
        
        // добавление кнопки 4
        button4 = UIButton(type: .custom )
        button4.frame = CGRect(x: button1.frame.size.width + 20  , y: button1.frame.size.height + 30, width: (menuPageScrollView.frame.size.width / 2) - 20, height: menuPageScrollView.frame.size.height / 5)
        button4.setTitle("Четвертая", for: .normal)
        button4.setBackgroundImage(UIImage(named:"problemi s zubami"), for: .normal)
        addButton(button: button4)
    }
    
}
