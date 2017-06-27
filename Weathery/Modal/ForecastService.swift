//
//  ForecastService.swift
//  Weathery
//
//  Created by Guled Ali on 6/25/17.
//  Copyright © 2017 Duc Tran. All rights reserved.
//

import Foundation

class ForcastService {
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    init(APIKey: String){
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
        func getForecast(latitude: Double, longitude: Double, completion: @escaping (CurrentWeather?) -> Void){
            if let forecastURL = URL(string:"\(forecastBaseURL!)/\(latitude),\(longitude)"){
                let networkProcessor = NetworkProcessor(url: forecastURL)
                networkProcessor.downloadJSONFromURL({ (jsonDictionary) in
                    
                    if let currentweatherDictionary = jsonDictionary?["currently"] as? [String: Any]{
                        let currentWeather = CurrentWeather(weatherDictionary: currentweatherDictionary)
                        completion(currentWeather)
                   
                        
                    } else{
                        completion(nil)
                    }
                
                })
                
            }
        }
    }

//https://api.darksky.net/forecast/5dc8294983118b5e7dea081126220cfc/37.8267,-122.4233
