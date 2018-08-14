//
//  ElectricityBillViewController.swift
//  ElectricityBill
//
//  Created by MacStudent on 2018-08-08.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ElectricityBillViewController: UIViewController {

    var billTotal = ElectrcityBill()
    
    @IBOutlet weak var textCustomerId: UITextField!
    
    @IBOutlet weak var textCustomerName: UITextField!
    
    
    @IBOutlet weak var textDatePicker: UITextField!
    
    @IBOutlet weak var textEnterCustomerEmail: UITextField!
    var datePicker: UIDatePicker?
    
    @IBOutlet weak var GenderSegment: UISegmentedControl!
   
    @IBAction func genderSwitch(_ sender: UISegmentedControl) {
        
        //let gender : Int?
        switch GenderSegment.selectedSegmentIndex {
        case 0:
            billTotal.gender = "male"
        case 1:
            billTotal.gender = "female"
        default:
            break;
        }
        
    }
    @IBOutlet weak var textToTalUnit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.didReceiveMemoryWarning()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(ElectricityBillViewController.dateChanged(datePicker:)), for: .valueChanged)
        textDatePicker.inputView = datePicker
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ElectricityBillViewController.viewTapped(gestureRecognizer:)))
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
       // Dispose of any resources that can be recreated.
    }
    
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        textDatePicker.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
        }
    
   
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)  {
        view.endEditing(true)
    }
    
    

    @IBAction func buttonSave(_ sender: Any) {
        let userName = textCustomerName.text
        let userCustomerId = textCustomerId.text
        let userDate = textDatePicker.text
        let userUnit = textToTalUnit.text
        let userEmail = textEnterCustomerEmail.text
        
        if isCustID(password: userCustomerId!) == true  {
            
            billTotal.custtomerId = (textCustomerId.text!)
        } else {
            displayAlertMessage(userMessage: "wrong customer ID")
        }
        
        
        
        // check for  empty fields
        if ((userName?.isEmpty)! || (userCustomerId?.isEmpty)! || (userDate?.isEmpty)! || (userUnit?.isEmpty)!)||(userEmail?.isEmpty)!
        {
            // alert message if field is empty
            displayAlertMessage(userMessage: "All Fields Are required")
            return
        }
        // email validation
        if isValidEmail(testStr: userEmail!) == true {
            billTotal.userEmailId = textEnterCustomerEmail.text
        } else {
            displayAlertMessage(userMessage: "enter correct email")
        }
        
        
        billTotal.custtomerName = textCustomerName.text!
        billTotal.totalUnit = Int(Double(textToTalUnit.text!)!)
        billTotal.totalBill(totalUnit: Int(Double(textToTalUnit.text!)!))
        billTotal.billDate = (textDatePicker.text)
        if GenderSegment.selectedSegmentIndex == 1
        {
            billTotal.gender = "Female"
        }
        else
        {
            billTotal.gender = "Male"
        }
        //billTotal.gender = String(GenderSegment.gend)
       // let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //let displayViewController = storyBoard.instantiateViewController(withIdentifier: "DisplayVC") as! DisplayViewController
        //self.present(displayViewController, animated: true, completion: nil)
        performSegue(withIdentifier: "DVC", sender: self)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using
        if let displayVC = segue.destination as? DisplayViewController
        {
            displayVC.billTotal = billTotal
        }
    }
    
    // stack over flow 
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    func isCustID(password: String) -> Bool {
        if (textCustomerId.text?.count)! <= 10 && (textCustomerId.text?.hasPrefix("C"))! {
            return true
        }else{
            return false
        }
    }
    
//    func isPasswordValid(_ password : String) -> Bool{
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
//        return passwordTest.evaluate(with: password)
//    }
//
//    func isPasswordValid(_ password : String) -> Bool{
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[C](?=.*[0-9].*[0-9].*[0-9].*[0-9].*[0-9].*[0-9].*[0-9].*[0-9].*[0-9]).{10}$")
//        return passwordTest.evaluate(with: password)
//    }
  
    func displayAlertMessage(userMessage: String)
    {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert,animated: true, completion: nil)
    }
    
    
}
