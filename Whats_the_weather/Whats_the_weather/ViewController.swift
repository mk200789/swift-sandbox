//
//  ViewController.swift
//  Whats_the_weather
//
//  Created by Wan Kim Mok on 1/22/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cityTextField: UITextField!
    
    @IBOutlet var weatherResultLabel: UILabel!
    
    @IBAction func getWeather(sender: AnyObject) {
        
        let city = NSString(string: cityTextField.text).stringByReplacingOccurrencesOfString(" ",  withString: "-")
        
        let url = NSURL(string: "http://www.weather-forecast.com/locations/"+city+"/forecasts/latest")!
        
        //create a session to obtain the content from the url
        let task = NSURLSession.sharedSession().dataTaskWithURL(url){ (data, response, error) -> Void in
            
            //Execute this once task is completed
            if let urlContent = data{
                
                //convert page content to nsutf8
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                let websiteArray = webContent!.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")

                
                if websiteArray.count > 1{
                    
                    //splits in array when there's </span>
                    let weatherArray = websiteArray[1].componentsSeparatedByString("</span>")
                    
                    if weatherArray.count > 1{
                        
                        //first component is what is needed and replace &deg with the actual deg sign
                        let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º" )

                        dispatch_async(dispatch_get_main_queue(), { () -> Void in

                            self.weatherResultLabel.text = weatherSummary
                            
                            print(weatherSummary)


                        })
                    }

                }

                
                
                
            }
            else{
                //If no data, show an error message
            }
        }
        
        //run the task
        task.resume()

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

