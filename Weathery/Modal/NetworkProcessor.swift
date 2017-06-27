//
//  NetworkProcessor.swift
//  Weathery
//
//  Created by Guled Ali on 6/25/17.
//  Copyright © 2017 Duc Tran. All rights reserved.
//

import Foundation
class NetworkProcessor{
    
    lazy  var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    lazy  var session: URLSession = URLSession(configuration: self.configuration)
    
    let url: URL
    
    init(url:URL){
        self.url = url
    }
    
    // create a clourse
    typealias JSONDictionaryHandler = (([String: Any]?) -> Void)
    
    func downloadJSONFromURL(_ completion: @escaping JSONDictionaryHandler){
        let request = URLRequest(url: self.url)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil{
                if let httpResponse = response as? HTTPURLResponse{
                    switch httpResponse.statusCode{
                    case 200:
                        //Success
                        if let data = data{
                            do {
                            let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                            
                                completion(jsonDictionary as? [String : Any])
                            }
                            catch let error as NSError{
                                print("Error processing json data \(error.localizedDescription)")
                            }
                        }
                        
                         default:
                        print("Status code is \(httpResponse.statusCode)")
                    }
                }
            }
            else {
                print("\(String(describing: error?.localizedDescription))")
            }
        }
        dataTask.resume()
    }
    
    
}
