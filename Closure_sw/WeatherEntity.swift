//
//  WeatherEntity.swift
//  Closure_sw
//
//  Created by mac on 2/23/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation

class WeatherEntity: BaseEntity {
    
    var id:Double!
    var cloudsAll:Double!
    var tempCity = TempEntity()
    var descriptionCity = DescriptionEntity()


    override func parse(response: NSDictionary) {
        super.parse(response)
        // parse data 
        id = response["id"] as! Double
        let cloud = response["clouds"] as! NSDictionary
        cloudsAll = cloud["all"] as! Double
        
        let tempInfo = response["main"] as! NSDictionary
        tempCity.parse(tempInfo)
        
        let desArray = response["weather"] as! [NSDictionary]
        let des = desArray[0]
        descriptionCity.parse(des)
    }
}