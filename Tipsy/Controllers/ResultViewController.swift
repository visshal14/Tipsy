//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Vishal Pal on 26/01/23.


import UIKit

class ResultViewController: UIViewController {

    var totalBill:String = ""
    var tip = ""
    var numberOfPeople = 0
    
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalBill
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tip)% tip."
        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true,completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
