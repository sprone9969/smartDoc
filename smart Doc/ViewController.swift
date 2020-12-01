//
//  ViewController.swift
//  my service book
//
//  Created by Умид Халилов on 01.04.2020.
//  Copyright © 2020 Умид Халилов. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBAction func phoneChange(_ sender: Any) { // проверяем на измненеие  https://stackoverflow.com/questions/28394933/how-do-i-check-when-a-uitextfield-changes

        if phoneTxtFld.text?.count == 3 {
            print("вошел")
            self.phoneTxtFld.text! += " "
        }
        if phoneTxtFld.text?.count == 7 {
            self.phoneTxtFld.text! += " "
        }
        if phoneTxtFld.text?.count == 8 {
//            self.phoneTxtFld.text! -= ""
               }
    }
    
    
    @IBOutlet weak var vhodVk: UIButton!
    @IBOutlet weak var vhodBtn: UIButton!
    @IBOutlet weak var registrationBtn: UIButton!
    @IBOutlet weak var phoneTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    var telError = false, pasError = false
    let vkVersion = "5.52"
    let vkClientId = "7665644"
    
    struct urlStruct {
        let urlString = "https://oauth.vk.com/authorize?client_id=7665644&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=friends&response_type=token&v=5.52"
    }
    


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneTxtFld.delegate = self
        vhodBtn.layer.cornerRadius = vhodBtn.frame.size.height / 4
        registrationBtn.layer.cornerRadius = registrationBtn.frame.size.height / 4
        vhodVk.layer.cornerRadius = vhodVk.frame.size.height / 4
        
        
      
        
        
    }
    
    @IBAction func vhodVkBtn(_ sender: Any) {
       
        performSegue(withIdentifier: "segue", sender: self)
       
        guard let url = URL(string:  "") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("error")
                    return
                }
                guard let data = data else { return }
                let someString = String(data: data, encoding: .utf8)
                print(someString ?? "no data")
                
            }
        }.resume()
    }
    
    @IBAction func LogInBtn(_ sender: Any) {
        if phoneTxtFld.text == "" {
            errorBorder(textField: phoneTxtFld)
            telError = true
        }
        else {
            telError = false
        }
        if passwordTxtFld.text == ""{
            errorBorder(textField: passwordTxtFld)
            pasError = true
        }
        else {
            pasError = false
        }
        if phoneTxtFld.text != "" && passwordTxtFld.text != "" {
            admin()
        }
        alert()
    }
    
    
    //MARK: ALERT
    func alert() {
        if telError == true && pasError == true {
            let alert = UIAlertController(title: "Ошибка!", message: "Вы не ввели номер телефона и пароль", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        if telError == true {
            let alert = UIAlertController(title: "Ошибка!", message: "Вы не ввели номер телефона", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        if pasError == true {
            let alert = UIAlertController(title: "Ошибка!", message: "Вы не ввели пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    //MARK: STOP EMPTY
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in:currentText) else {
            return false
        }
        
        let updateText = currentText.replacingCharacters(in: stringRange, with: string)
        return updateText.count < 12
        
    }
    
    //MARK: SIGN IN ADMIN
    func admin() {
        if phoneTxtFld.text == "99999999999" && passwordTxtFld.text == "admin" {
            performSegue(withIdentifier: "carSegue", sender: self)
        }
        else {
            let alert = UIAlertController(title: "Ошибка!", message: "Неправильный номер или пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    //MARK:ERROR BORDER
    public func errorBorder(textField: UITextField) {
        textField.layer.cornerRadius = textField.frame.size.height / 4
        //textField.layer.borderWidth = 2
        //textField.layer.borderColor =  UIColor.red.cgColor
    }
}

//MARK: Phone TEXTFIELD CHANGE




