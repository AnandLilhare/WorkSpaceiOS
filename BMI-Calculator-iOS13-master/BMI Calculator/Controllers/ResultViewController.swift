//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Anand Lilhare on 23/09/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var adviceLable: UILabel!
    @IBOutlet weak var bmiLable: UILabel!
    var bmiValue: String?
    var advice: String?
    var color:UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLable.text = bmiValue
        adviceLable.text = advice
        view.backgroundColor = color
        
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
