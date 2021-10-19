//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var coinManager = CoinManager()
    @IBOutlet weak var currencyPicer: UIPickerView!
    @IBOutlet weak var bitCoinLabel: UILabel!
    @IBOutlet weak var currencyLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        coinManager.delegate = self
        currencyPicer.dataSource = self
        currencyPicer.delegate = self
    }
}
    //MARK: - CoinManagerDelegate
    extension ViewController: CoinManagerDelegate {
        
        func didUpdatePrice(price: String, currency: String) {
            
            DispatchQueue.main.async {
                self.bitCoinLabel.text = price
                self.currencyLable.text = currency
            }
        }
        
        func didFailWithError(error: Error) {
            print(error)
        }
    }

    //MARK: - UIPickerView DataSource & Delegate
    extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
              return 1
          }
          
          func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
              return coinManager.currencyArray.count
          }
          
          func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
              return coinManager.currencyArray[row]
          }
          
          func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
              let selectedCurrency = coinManager.currencyArray[row]
              coinManager.getCoinPrice(for: selectedCurrency)
          }
    }


