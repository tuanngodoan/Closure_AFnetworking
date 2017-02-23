//
//  RequestAFnetworking.swift
//  Closure_sw
//
//  Created by mac on 2/22/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation
import AFNetworking

typealias CompletionBlock = (isSuccess:Bool, response: NSDictionary?, error:NSError?) -> Void

class RequesterAPI {
    static let sharedInstance = RequesterAPI()
    let manager : AFHTTPSessionManager

    init() {
        //
        manager = AFHTTPSessionManager()
        
    }
    
    func getWeatherWithCity(cityName:NSString, completion: CompletionBlock){
        let parameters = ["q":cityName,"appid":"ad424b078a472e3905a9a3ee086d9871"]
        let baseUrl = "http://api.openweathermap.org/data/2.5/weather?"
        
        manager.GET(baseUrl, parameters: parameters, success: { (sessionTaskData, responObject) -> Void in
            
            let json = responObject as! NSDictionary
            // parameters jsonBlock
            completion(isSuccess: true, response: json , error: nil)
            
        }) { (sessionTaskData, error) in
            // request fail
            completion(isSuccess: false, response: nil, error: error)
        }
        
    }
}




