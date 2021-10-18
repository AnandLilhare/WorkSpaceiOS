//
//  Weath/Users/anandlilhare/Documents/Work/iOS_WorkSpace/WorkSpaceiOS/Clima-iOS13-master/ClimaerManagerFile.swift
//  Clima
//
//  Created by Anand Lilhare on 06/10/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation
protocol WeatherManagerDelegat {
    func didUpdateWeather(_ weatherManager:WeatherManager,weather: WeatherModel)
    func didFailWithError(error : Error)
}
struct WeatherManager {
    
var delegate : WeatherManagerDelegat?
   let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=5be94197ef1104526d20f0412401e04e&units=metric"
    
    func fetchWeather(cityName : String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        perfromRequest(urlString: urlString)
    }
    
    func fetchWeather(latitude:CLLocationDegrees, longitude:CLLocationDegrees) {
        let urlString = "\(weatherUrl)&lat=\(latitude)&lon=\(longitude)"
        perfromRequest(urlString: urlString)
    }
    
    func perfromRequest(urlString:String) {
        //1. Create url
        if let url = URL(string:urlString){
            //2. Url Session
            let session = URLSession(configuration: .default)
            
            //3. Give the sessin Task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                   if let weather = self.parseJson(data: safeData) {
                    delegate?.didUpdateWeather(self, weather: weather)
                    }
                    
                }
            }
            //4. Start Task
            task.resume()
            
            
        }
       
    }
    func parseJson(data:Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodeDate = try decoder.decode(WeatherParseData.self, from: data)
            let weatherModel = WeatherModel(condtionId: decodeDate.weather[0].id, cityName: decodeDate.name, temprature: decodeDate.main.temp)
            return weatherModel
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
