//
//  ViewController.swift
//  iosPrework
//
//  Created by Leonardo Langgeng on 1/17/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmountFieldText: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billAmountFieldText.text!) ?? 0
        let tipPercentage = [0.15, 0.18, 0.20]
        
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
        
        
    }
    
}

