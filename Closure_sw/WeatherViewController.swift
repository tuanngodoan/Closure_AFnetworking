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

    var city = "Ha Noi"
    override func viewDidLoad() {
        super.viewDidLoad()
        getJson("http://api.openweathermap.org/data/2.5/weather?q=Hanoi&appid=ad424b078a472e3905a9a3ee086d9871")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getJson(path: String){
        let url = NSURL(string: path)
        
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: url!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(urlRequest){
            (data,response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            if (statusCode == 200) {
                
                do {
                    let json  = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                
                    print(json)
                    
                }catch{
                    print("Error")
                }
                
            }
        }
        task.resume()
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
