//
//  CityWeather.swift
//  Closure_sw
//
//  Created by mac on 2/22/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation

class CityWeather{
    
    var nameCity:String!
    var id:Double!
    var nameLocation:String!
    var cloudsAll:Double!
    var tempEntity:tempCity!
    var descriptionEntity:descriptionWeather!
    
    var request:RequestAPIWeather!
    
    init(id :Double,nameLocation: String, cloudsAll: Double, nameCity:String){
        self.id = id
        self.nameLocation = nameLocation
        self.cloudsAll = cloudsAll
        self.nameCity = nameCity
    }
    
    func getWeather(){
        
        request = RequestAPIWeather(cityName: nameCity)
        
        
    }
    
}