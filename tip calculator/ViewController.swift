//
//  ViewController.swift
//  tip calculator
//
//  Created by Leonardo Langgeng on 2/4/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SplitStepper.minimumValue = 1
    }
    
    var tipPercentage = 15.0
    
    
    @IBOutlet weak var BillAmount: UITextField!
    
    @IBOutlet weak var TipPreset: UISegmentedControl!
    
    
    @IBOutlet weak var TipSlider: UISlider!

    @IBOutlet weak var TipPercent: UILabel!
    
    @IBOutlet weak var TipAmount: UILabel!
    
    @IBOutlet weak var TotalAmount: UILabel!
    
    @IBOutlet weak var SplitBy: UILabel!
    
    @IBOutlet weak var SplitStepper: UIStepper!
    
    @IBOutlet weak var SplitAmount: UILabel!
    
    
    @IBAction func BillAmountUpdate(_ sender: Any) {
        updateCalc()
    }
   
    @IBAction func TipPresetUpdate(_ sender: Any) {
        TipSlider.setValue(0.0, animated: true)
        
        let presetPercent = [15.0, 18.0, 20.0]
        
        tipPercentage = presetPercent[TipPreset.selectedSegmentIndex]
        
        TipPercent.text = String(tipPercentage)
        
        updateCalc()
    }
    
    
    @IBAction func TipSliderUpdate(_ sender: Any) {
        let percent = 10 + (TipSlider.value * 20)
        
        tipPercentage = Double(percent)
        
        TipPercent.text = String(format:"%.2f", tipPercentage)
        
        updateCalc()
    }
    
    @IBAction func TipAmountUpdate(_ sender: Any) {
        TipSlider.setValue(0.0, animated: true)
        updateCalc()
    }
    
    
    @IBAction func SplitStepperUpdate(_ sender: Any) {
        SplitBy.text = String(Int(SplitStepper.value))
        updateCalc()

    }
    
    
    
    
    
    func updateCalc(){
        let bill = Double(BillAmount.text!) ?? 0
        
        let tip = bill * tipPercentage / 100
        
        let parties = SplitStepper.value
        
        let total = bill + tip
        
        let each = total / parties
        
        //update tip amount
        TipAmount.text = String(format:"$%.2f", tip)
        
        //update total amount
        TotalAmount.text = String(format:"$%.2f", total)
        
        //update total each amount
        SplitAmount.text = String(format:"$%.2f", each)
    }
}

