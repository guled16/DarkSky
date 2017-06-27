//
//  AppDelegate.swift
//  Weathery
//
//  Created by Duc Tran on 5/23/17.
//  Copyright © 2017 Duc Tran. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        let forecastService = ForcastService(APIKey: "5dc8294983118b5e7dea081126220cfc")
        forecastService.getForecast(latitude: 37.8267, longitude: -122.4233) { (currentWeather) in
            if let currentWeather = currentWeather{
                print(currentWeather)
            }
        }

        return true
    }



}

