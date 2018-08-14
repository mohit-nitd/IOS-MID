//
//  LoginViewController.swift
//  ElectricityBill
//
//  Created by MacStudent on 2018-08-08.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var textEmailID: UITextField!
    
    
    @IBOutlet weak var textPassword: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonLogin(_ sender: Any) {
        if (textEmailID.text == "admin123" && textPassword.text == "admin") {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let homeViewController = storyBoard.instantiateViewController(withIdentifier: "electricityVC") as! ElectricityBillViewController
            self.present(homeViewController, animated: true, completion: nil)
//
            }else
        {
            let myAlert = UIAlertController(title: "Alert", message: "Login Unsucessfull", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert,animated: true, completion: nil)
            
            }
        }
    
    
//    @objc func goNextScreen(){
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//         let elctricityVC = storyBoard.instantiateViewController(withIdentifier: "electricityVC") as! ElectricityBillViewController
//
//
//    }
   
//    @IBAction func switchRemember(_ sender: Any) {
//    }
//    
//    func stateChanged(_ switchState: UISwitch) {
//        
//        let defaults: UserDefaults? = UserDefaults.standard
//        if switchState.isOn() {
//            defaults?.set(true, forKey: "ISRemember")
//            defaults?.set(loginTxt.text, forKey: "SavedUserName")
//            defaults?.set(passwordTxt.text, forKey: "SavedPassword")
//        }
//        else {
//            defaults?.set(false, forKey: "ISRemember")
//        }
//    }
    
    
    
    
    
    
    

}
