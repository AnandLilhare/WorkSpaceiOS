//
//  WeatherData.swift
//  Clima
//
//  Created by Anand Lilhare on 06/10/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherParseData: Codable{
    let name : String
    let main : Main
    let weather : [Weather]
}

struct Main: Codable {
    let temp : Double
}
struct Weather: Codable {
    let description : String
    let id:Int
}
