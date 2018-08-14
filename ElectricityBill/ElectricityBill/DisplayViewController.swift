//
//  DisplayViewController.swift
//  ElectricityBill
//
//  Created by MacStudent on 2018-08-08.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

   var billTotal = ElectrcityBill()
    @IBOutlet weak var labelCustomerId: UILabel!
    
    
    @IBOutlet weak var labelCustomerName: UILabel!
    
    @IBOutlet weak var labelUserEmailid: UILabel!
    
    @IBOutlet weak var labelDate: UILabel!
    
    @IBOutlet weak var labelGender: UILabel!
    
    @IBOutlet weak var totalUnit: UILabel!
    
    @IBOutlet weak var labelTotalBill: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        labelCustomerName.text = billTotal.custtomerName
        labelCustomerId.text = String(billTotal.custtomerId!)
        totalUnit.text = String(billTotal.totalUnit!)
        labelTotalBill.text = "CAD:\(String(billTotal.totalBill(totalUnit: billTotal.totalUnit!)))"
        //labelTotalBill.text = String(billTotal.totalBill(totalUnit: billTotal.totalUnit!))
        labelGender.text = billTotal.gender
        labelDate.text = billTotal.billDate
        labelUserEmailid.text = billTotal.userEmailId
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bckButton(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = storyBoard.instantiateViewController(withIdentifier: "electricityVC") as! ElectricityBillViewController
        self.present(homeViewController, animated: true, completion: nil)
    }
    
    @IBAction func buttonLogout(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginVCScreen") as! LoginViewController
        self.present(loginViewController, animated: true, completion: nil)
    }
    

}
