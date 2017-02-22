//
//  RequestAFnetworking.swift
//  Closure_sw
//
//  Created by mac on 2/22/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation
import AFNetworking

class RequestAPIWeather {
    
    var cityName:String
    var jsonBlock: ((json: NSDictionary) -> Void)?
    
    init(cityName:String){
        self.cityName = cityName
    }

    
    func loadJson(){
        let parameters = ["q":cityName,"appid":"ad424b078a472e3905a9a3ee086d9871"]
        let baseUrl = "http://api.openweathermap.org/data/2.5/weather?"

        let manager = AFHTTPSessionManager()
        
        manager.GET(baseUrl, parameters: parameters, success: { (sessionTaskData, responObject) in
            
                //
            let json = responObject as! NSDictionary
            
            // json Block
            self.jsonBlock!(json: json)
           
        }) { (sessionTaskData, error) in
                //
                
        }
    }
    // parse entity from JsonWeather
    func parseJson(keyID key: String, WeatherJson dictionary : NSDictionary) -> AnyObject{
        
        if let idKey = dictionary[key]! as AnyObject!{
            return idKey
        }
    }
}




