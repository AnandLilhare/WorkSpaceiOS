//
//  WeatherModel.swift
//  Clima
//
//  Created by Anand Lilhare on 07/10/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let condtionId:Int
    let cityName:String
    let temprature:Double
    
    var tempratureString : String {
        return String(format: "%.1f", temprature)
    }
    
    var conditionName : String {
        switch condtionId {
        case 200...232:
        return "cloud.bolt"
        case 300...321:
        return "cloud.drizzle"
        case 500...531:
        return "cloud.rain"
        case 600...622:
        return "cloud.snow"
        case 701...781:
        return "cloud.fog"
        case 800:
        return "cloud.max"
        case 801...804:
        return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
   
}
