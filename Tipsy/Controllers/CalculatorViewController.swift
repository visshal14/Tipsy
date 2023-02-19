//
//  ViewController.swift
//
//  Created by Vishal Pal

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    var billTotal =  0.0
    var tip = 0.1
    var numberOfPeople = 2
    var billPerPeople = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        if sender.currentTitle! == "0%"{
            zeroPctButton.isSelected = true
            tip = 0.0
        }else if sender.currentTitle! == "10%"{
            tenPctButton.isSelected = true
            tip = 0.1
        }else{
            twentyPctButton.isSelected = true
            tip = 0.2
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format:"%.0f",sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        let billTotal = Double(bill)!
        if bill != "" {
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            billPerPeople = String(format:"%0.2f",result)
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalBill = billPerPeople
            destinationVC.tip = String(format:"%.0f",tip*Double(100))
            destinationVC.numberOfPeople = numberOfPeople
            
        }
    }

}

