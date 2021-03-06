//
//  DescriptionWeather.swift
//  Closure_sw
//
//  Created by mac on 2/22/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation

class DescriptionEntity: BaseEntity{
    
    var description:String!
    var main:String!

    override func parse(dict : NSDictionary) -> Void{
        super.parse(dict)
        self.description = dict["description"] as! String
        self.main = dict["main"] as! String
    }

}