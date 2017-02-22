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

    @IBOutlet weak var weatherTextField: UITextField!

    @IBOutlet weak var tempTextField: UITextField!
    
    @IBOutlet weak var tempMaxTextField: UITextField!
    
    @IBOutlet weak var tempMinTextField: UITextField!
    
    @IBOutlet weak var speedTextField: UITextField!
    
    @IBOutlet weak var degTextField: UITextField!
    
    
    
    var  getCityWeather:
    
    //var city = "Ha Noi"
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchWeatherButton(sender: AnyObject) {
        requestWeather = RequestAPI(cityName: String(cityNameTextField.text))
        requestWeather.loadJson()
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
