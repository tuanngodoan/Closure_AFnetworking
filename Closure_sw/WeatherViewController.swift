//
//  WeatherViewController.swift
//  Closure_sw
//
//  Created by mac on 2/17/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
import Foundation
import AFNetworking

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var weatherCity:WeatherEntity!
    
    override func viewDidLoad() {
        weatherCity = WeatherEntity()
        super.viewDidLoad()
        
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchWeatherButton(sender: AnyObject) {
        getWeather(String(cityNameTextField.text))
        
    }
    // Get Weather
    func getWeather(city: NSString){
        RequesterAPI.sharedInstance.getWeatherWithCity(city) { (isSuccess, response, error) in
           
            if isSuccess {
                dispatch_async(dispatch_get_main_queue()){
                    self.weatherCity.parse(response!)
                    self.updateUI()
                }
            }else{
                print("error = ", error?.description)
            }
            

        
     }
    }
    // UPDATE UI
    func updateUI(){
        descriptionTextField.text  = weatherCity.descriptionCity.description
        print("ID = \(weatherCity.id)")
        print("Clouds = \(weatherCity.cloudsAll)")
        print("Temp = \(weatherCity.tempCity.temp)")
        print("Descrip = \(weatherCity.descriptionCity.description)")
    }


}
