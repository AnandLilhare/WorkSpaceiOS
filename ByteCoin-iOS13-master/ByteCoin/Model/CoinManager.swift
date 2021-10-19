//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation



//By convention, Swift protocols are usually written in the file that has the class/struct which will call the
//delegate methods, i.e. the CoinManager.
protocol CoinManagerDelegate {
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}



struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "EF4CDF73-0DEA-48E3-A7CC-85643481D902"
    var delegate: CoinManagerDelegate?
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
           
           //Use String concatenation to add the selected currency at the end of the baseURL along with the API key.
           let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
           
           //Use optional binding to unwrap the URL that's created from the urlString
           if let url = URL(string: urlString) {
               
               //Create a new URLSession object with default configuration.
               let session = URLSession(configuration: .default)
               
               //Create a new data task for the URLSession
               let task = session.dataTask(with: url) { (data, response, error) in
                   if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                       return
                   }
                if let safeData = data {
                    if let bitcoinPrice = self.parseJSON(safeData) {
                                           
                                           //Optional: round the price down to 2 decimal places.
                                           let priceString = String(format: "%.2f", bitcoinPrice)
                                           
                                           //Call the delegate method in the delegate (ViewController) and
                                           //pass along the necessary data.
                                           self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                                       }
                    }
                   
               }
               //Start task to fetch data from bitcoin average's servers.
               task.resume()
           }
       }

    func parseJSON(_ data: Data) -> Double? {
            
            //Create a JSONDecoder
            let decoder = JSONDecoder()
            do {
                
                //try to decode the data using the CoinData structure
                let decodedData = try decoder.decode(CoinData.self, from: data)
                
                //Get the last property from the decoded data.
                let lastPrice = decodedData.rate
                print(lastPrice)
                return lastPrice
                
            } catch {
                
                //Catch and print any errors.
                delegate?.didFailWithError(error: error)
                return nil
            }
        }
        
    
}
