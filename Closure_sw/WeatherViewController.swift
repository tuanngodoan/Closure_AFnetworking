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
    
    
    
    var weatherJson:NSDictionary!
    var tempEntity = temperature()
    var  weatherEntity = weatherDesc()
    var  windEntity = wind()
    
    //var city = "Ha Noi"
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        //getJson(urlPath: "http://api.openweathermap.org/data/2.5/weather?q=Hanoi&appid=ad424b078a472e3905a9a3ee086d9871")
        let cityName = " Hai Duong"
        let urlRequest = "http://api.openweathermap.org/data/2.5/weather?"
        let parameters = ["q":cityName,"appid":"ad424b078a472e3905a9a3ee086d9871"]
        requestCity(urlRequest, parameter: parameters)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchWeatherButton(sender: AnyObject) {
        
        let cityName = String(cityNameTextField.text)
        let urlRequest = "http://api.openweathermap.org/data/2.5/weather?"
        let parameters = ["q":cityName,"appid":"ad424b078a472e3905a9a3ee086d9871"]
        requestCity(urlRequest, parameter: parameters)
 
    }
    
    
    func requestCity(urlRequest: String, parameter par: NSDictionary){
        
        let manager = AFHTTPSessionManager()
        
        manager.GET(urlRequest, parameters: par, success: { (sessionDataTask, responObject: AnyObject?) in

            //print(responObject!.description)
            
            if let dic = responObject as? NSDictionary{
                self.parseJsonTempEntity(weatherJson: dic)
            }
            
        }) { (sessionDataTask, error) in
            //
            //
            //
        }
        
    }

    func updateWeather(){
        weatherTextField.text = weatherEntity.descriptionWeather
        tempTextField.text = String(tempEntity.temp)
        tempMinTextField.text = String(tempEntity.temp_min)
        tempMaxTextField.text = String(tempEntity.temp_min)
        speedTextField.text = String(windEntity.speed)
        degTextField.text = String(windEntity.deg)
    }
    
    
    // download json from api http://api.openweathermap.org
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
                    self.parseJsonTempEntity(weatherJson: json )
                    self.parseJsonWeatherEntity(weatherJson: json)
                    self.parseJsonWindEntity(weatherJson: json)
                    
                }catch{
                    print("Error")
                }
                
            }
        }
        task.resume()
    }
    
    func parseJsonTempEntity(weatherJson json: NSDictionary){
        
       if let main = json["main"] as? [String:AnyObject]{
            if let temp = main["temp"] as? Double {
                tempEntity.temp = temp
                print("temp = \(temp)")
            }
            if let temp_min = main["temp_min"] as? Double{
                tempEntity.temp_min = temp_min
                print("temp_min = \(temp_min)")
            }
            if let temp_max = main["temp_max"] as? Double{
                tempEntity.temp_max = temp_max
                print("temp_max = \(temp_max)")
            }
        
        }
        
    }
    
    func parseJsonWeatherEntity(weatherJson json: NSDictionary){
        
        if let weatherDescription = json["weather"] as? [String:AnyObject]{
            
            if let des = weatherDescription["description"] as? String{
                    weatherEntity.descriptionWeather = des
                print("Description Weather = \(des)")
            }
            
        }
        
    }
    
    func parseJsonWindEntity(weatherJson json: NSDictionary ){
        
        if let windInfo = json["wind"] as? [String:AnyObject]{
            
            if let speed = windInfo["speed"] as? Double{
                windEntity.speed = speed
                print("Speed = \(speed)")
            }
            if let deg = windInfo["deg"] as? Double{
                windEntity.deg = deg
                print("Deg = \(deg)")
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
