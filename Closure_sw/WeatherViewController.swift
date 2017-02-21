//
//  WeatherViewController.swift
//  Closure_sw
//
//  Created by mac on 2/17/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
import Foundation

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherTextField: UITextField!

    @IBOutlet weak var tempTextField: UITextField!
    
    @IBOutlet weak var tempMaxTextField: UITextField!
    
    @IBOutlet weak var tempMinTextField: UITextField!
    
    @IBOutlet weak var speedTextField: UITextField!
    
    @IBOutlet weak var degTextField: UITextField!
    
    
    //var city = "Ha Noi"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tempEntity = temperature()
        weathEntity = weatherDesc()
        windEntity = wind()
        
        getJson(urlPath: "http://api.openweathermap.org/data/2.5/weather?q=Hanoi&appid=ad424b078a472e3905a9a3ee086d9871")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var weatherJson:NSDictionary!
    var tempEntity:temperature!
    var weathEntity:weatherDesc!
    var windEntity:wind!
    
    func updateWeather(){
        
        weatherTextField.text = weathEntity.descriptionWeather
        tempTextField.text = String(tempEntity.temp)
        tempMinTextField.text = String(tempEntity.temp_min)
        tempMaxTextField.text = String(tempEntity.temp_min)
        speedTextField.text = String(windEntity.speed)
        degTextField.text = String(windEntity.deg)
        
        
    }
    
    func getJson(urlPath path: String){
        let url = NSURL(string: path)
        
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: url!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(urlRequest){
            (data,response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            if (statusCode == 200) {
                
                do {
                    let json  = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
                    
                    // parse Json to Entity
                    self.parseJsonTempEntity(self.tempEntity, weatherJson: json )
                    //self.parseJsonWeatherEntity(self.weathEntity, weatherJson: json)
                   // self.parseJsonWindEntity(self.windEntity, weatherJson: json)
                    
                }catch{
                    print("Error")
                }
                
            }
        }
        task.resume()
    }
    
    func parseJsonTempEntity(templeEntity: temperature ,weatherJson json: NSDictionary){
        
        if let main = json["main"] as? [String:AnyObject]{
            
            guard   let temp = main["temp"] as? Double,
                    let temp_min = main["temp_min"] as? Double,
                    let temp_max = main["temp_max"] as? Double
                else{return}
            
            templeEntity.temp = temp
            templeEntity.temp_min = temp_min
            templeEntity.temp_max = temp_max
//
//            if let temp = main["temp"] as? Double {
//                templeEntity.temp = temp
//            }
//            if let temp_min = main["temp_min"] as? Double{
//                templeEntity.temp_min = temp_min
//            }
//            if let temp_max = main["temp_max"] as? Double{
//                templeEntity.temp_max = temp_max
//            }
            
        }
        
    }
    
    func parseJsonWeatherEntity(weatherEntity:weatherDesc, weatherJson json: NSDictionary){
        
        if let weatherDescription = json["weather"] as? [String:AnyObject]{
            
            if let des = weatherDescription["description"] as? String{
                weatherEntity.descriptionWeather = des
            }
            
        }
        
    }
    
    func parseJsonWindEntity(windEntity:wind, weatherJson json: NSDictionary ){
        
        if let windInfo = json["wind"] as? [String:AnyObject]{
            
            if let speed = windInfo["speed"] as? Double{
                windEntity.speed = speed
            }
            if let deg = windInfo["deg"] as? Double{
                windEntity.deg = deg
            }
            
        }
        
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
