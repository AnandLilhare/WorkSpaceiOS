//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculateBrain = CalculateBrain()
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightLable: UILabel!
    @IBOutlet weak var heightLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func weightSliderAction(_ sender: UISlider) {
        weightLable.text = "\(Int(sender.value))kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    let weightValue = weightSlider.value
    let heightValue = heightSlider.value
    calculateBrain.calculateBMI(height:heightValue, weight:weightValue)
    self.performSegue(withIdentifier: "goToResult", sender:self)
        
    }
    @IBAction func heightSliderAction(_ sender: UISlider) {
      heightLable.text = "\(String(format: "%.2f",sender.value))m"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let destinationView = segue.destination as! ResultViewController
        destinationView.bmiValue = calculateBrain.getBMIValue()
        destinationView.advice = calculateBrain.getAdvice()
        destinationView.color = calculateBrain.getColor()
    }
}

