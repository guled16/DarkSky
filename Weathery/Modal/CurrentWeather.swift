//
//  CurrentWeather.swift
//  Weathery
//
//  Created by Guled Ali on 6/25/17.
//  Copyright © 2017 Duc Tran. All rights reserved.
//

import Foundation

class CurrentWeather{
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    let apparentTemperature:Int?
    
    struct WeatherKeys{
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
        static let apparentTemperature = "apparentTemperature"
    }
    
    init(weatherDictionary: [String: Any]){
        apparentTemperature = weatherDictionary[WeatherKeys.apparentTemperature] as? Int
        
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Double{
            humidity = Int(humidityDouble * 100)
        } else{
            humidity = nil
        }
        
        if let precipDobule =  weatherDictionary[WeatherKeys.precipProbability] as? Int {
            precipProbability = Int(precipDobule * 100)
        } else {
            precipProbability = nil
        }
        
        summary = weatherDictionary[WeatherKeys.summary] as? String
        temperature = weatherDictionary[WeatherKeys.temperature] as? Int
   }
}
/*
 currently: {
 time: 1498436618,
 summary: "Clear",
 icon: "clear-day",
 nearestStormDistance: 2,
 nearestStormBearing: 293,
 precipIntensity: 0,
 precipProbability: 0,
 temperature: 60.97,
 apparentTemperature: 57.36,
 dewPoint: 54.75,
 humidity: 0.8,
 windSpeed: 9.86,
 windGust: 13.85,
 windBearing: 257,
 visibility: 9.29,
 cloudCover: 0.21,
 pressure: 1014.59,
 ozone: 290.32,
 uvIndex: 2
 },
 */

