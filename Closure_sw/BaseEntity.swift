//
//  weather.swift
//  Closure_sw
//
//  Created by mac on 2/23/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation

class BaseEntity {
    
    var errorCode: Double?
    var jsonResponse: NSDictionary!
    
    func parse(response:NSDictionary) -> Void {
        errorCode = response["errorCode"] as? Double
        jsonResponse = response
    }
    
}