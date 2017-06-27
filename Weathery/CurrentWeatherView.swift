//
//  ViewController.swift
//  Weathery
//
//  Created by Guled Ali on 6/25/17.
//  Copyright © 2017 Duc Tran. All rights reserved.
//

import UIKit

class CurrentWeatherView: UIViewController {

    @IBOutlet var City: UILabel!
    @IBOutlet var tem: UILabel!
    
    let forecastAPIKey = "5dc8294983118b5e7dea081126220cfc"
   let coordinate: (lat:Double, long: Double) = (37.8267,-122.4233)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let forecastService = ForcastService(APIKey: forecastAPIKey)
        forecastService.getForecast(latitude: coordinate.lat, longitude: coordinate.long) { (currentWeather) in
            
                if let currentWeather = currentWeather{
                    
                    DispatchQueue.main.async {
                        
                        if let temperature = currentWeather.apparentTemperature{
                            self.tem.text = "\(temperature)"
                        } else{
                            self.tem.text = "-"
                        }
                    }
                }
            }
        }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
