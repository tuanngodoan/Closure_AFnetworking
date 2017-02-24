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
           self.weatherCity.parse(response!)
            self.updateUI()
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
