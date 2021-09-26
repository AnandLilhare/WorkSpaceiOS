//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Anand Lilhare on 23/09/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculateBrain {
   var bmiValue:BMI?
   mutating func calculateBMI(height:Float, weight:Float){
      let bmi = weight/(height * height)
    if bmi < 18.5 {
        bmiValue = BMI(value: bmi, advice:"Eat more banana", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
    } else if bmi < 24.9 {
        bmiValue = BMI(value: bmi, advice:"Fit is a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
    } else {
        bmiValue = BMI(value: bmi, advice:"do lot of exerices and eat less", color:#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
    }
   }
    func getBMIValue() -> String {
        return (String(format: "%.1f",bmiValue?.value ?? 0.0))
    }
    
    func getAdvice() -> String? {
        return bmiValue?.advice
    }
    
    func getColor() -> UIColor? {
        return bmiValue?.color
    }
 
}
