//
//  TempCity.swift
//  Closure_sw
//
//  Created by mac on 2/22/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation

class TempEntity: BaseEntity {
    
    var temp:Double!
    var temp_max:Double!
    var temp_min:Double!
    
    override func parse(dict: NSDictionary) -> Void {
        super.parse(dict)
        self.temp = dict["temp"] as! Double
        self.temp_max = dict["temp_max"] as! Double
        self.temp_min = dict["temp_min"] as! Double
    }
    
    func printTest(){
        print("temp  = \(temp)")
        print("temp_Max = \(temp_max)")
        print("temp_Min  = \(temp_min)")
    }
    
}