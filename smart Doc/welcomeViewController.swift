//
//  welcomeViewController.swift
//  smart Doc
//
//  Created by Умид Халилов on 23.09.2020.
//  Copyright © 2020 Умид Халилов. All rights reserved.
//

import UIKit

class welcomeViewController: UIViewController, UIScrollViewDelegate {
    
    
    var welcomePageScrollView = UIScrollView()
    var pageControl = UIPageControl()
    
    var button = UIButton()
    var page = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomePageScrollView.delegate = self // подписываемся на делегат
        let imgArr = [#imageLiteral(resourceName: "2pic"),#imageLiteral(resourceName: "1pic")] // массив с нашими картинками
        
        let scrollViewRec = self.view.bounds // показываем что все страницы будут одинаковые
        
        
        //Set attribute of UIScrollView
              welcomePageScrollView.contentSize.width = CGFloat(imgArr.count) * self.view.frame.width
              welcomePageScrollView.isPagingEnabled = true
              welcomePageScrollView.showsHorizontalScrollIndicator = true
              welcomePageScrollView.frame.size = self.view.frame.size
            self.view.addSubview(welcomePageScrollView)
        
        //создаем скрол
//        welcomePageScrollView = UIScrollView(frame: scrollViewRec)
//        welcomePageScrollView.isPagingEnabled = true
//        welcomePageScrollView.contentSize = CGSize(width: scrollViewRec.size.width * 2, height: scrollViewRec.size.height)
//        self.view.addSubview(welcomePageScrollView)
        
        // добавление кнопки
        button = UIButton(type: .roundedRect )
        button.frame = CGRect(x: 10  , y: scrollViewRec.size.height - 90, width: scrollViewRec.size.width - 20, height: 50)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.setTitle("Дальше", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        button.addTarget(self, action: #selector(buttonAction),  for: .touchUpInside)
        
        
       
 
        
        self.view.addSubview(button)
        
        
        //Loop to set the images to each page
        for n in 0 ..< imgArr.count {
            
            let imageView = UIImageView()
            imageView.image = imgArr[n]
            imageView.contentMode = .scaleAspectFit
            let xPosition = self.view.frame.width * CGFloat(n)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.welcomePageScrollView.frame.width, height: self.welcomePageScrollView.frame.height)
            welcomePageScrollView.addSubview(imageView)
        }
        
        
      
    }
    
//    //MARK: Универсальный метод добавление фото
//    func newImageViewWithImage(paramImage: UIImage, paramFrame: CGRect) -> UIImageView {
//        let result = UIImageView(frame: paramFrame)
//        result.contentMode = .scaleAspectFit
//        result.image = paramImage
//        return result
//
//    }
    //MARK: Действие кнопки
    @objc func buttonAction(sender: UIButton!) {
        if page == 1 {
             performSegue(withIdentifier: "registrationSegue", sender: self)
            print("произошел переход на регистрацию")
        } else if page == 0 {
            print("произошло изменение позиции")
            welcomePageScrollView.setContentOffset(CGPoint(x:view.frame.size.width, y:0), animated: true) // данный код двигает скролл вью
        } else {
            print("Error")
        }
    }
   
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
         page = scrollView.contentOffset.x / scrollView.frame.width
          pageControl.currentPage = Int(page)
          
           if page == 1 {
            print(1)
            button.setTitle("Хорошо", for: .normal)
          } else if page == 0 {
            print(2)
            button.setTitle("Дальше", for: .normal)
//              UIView.animate(withDuration: 0.2, animations: {self.button.frame.origin.y = self.view.frame.height - 5})
          }
      }
   
    
    //MARK: test
   
    
}
