//
//  PreferenceViewController.swift
//  Where2Meet
//
//  Created by Rebekah Li on 2/1/20.
//  Copyright © 2020 Angelo Domingo. All rights reserved.
//

import UIKit
import CoreLocation

class PreferenceViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var eatingButton: UIButton!
    @IBOutlet weak var activityButton: UIButton!
    @IBOutlet weak var studyButton: UIButton!
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var timeSlider: UISlider!
    
    @IBOutlet weak var cheapButton: UIButton!
    @IBOutlet weak var middleClassButton: UIButton!
    @IBOutlet weak var richButton: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var preferences = SubmissionRequest()
    
    var code: String? = ""
    var device_id: String = ""
    var location: Location = Location(lat: 0.0, lng: 0.0)
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "alt_bg.png")!)
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()

        
        preferences.device_id = self.device_id
        preferences.code = self.code
        preferences.lat = String(format:"%f", self.location.lat)
        preferences.lng = String(format:"%f", self.location.lng)
        preferences.category = "Eating"
        preferences.radius = "10000"
        preferences.price = "1"
        preferences.start_time = getStartTime()
        preferences.duration = "150"
        
        print(preferences)
        
        //code in case I wanna use extension to apply button design:
        //eatingButton.applyDesign()
    }
    
    @IBAction func eatingButtonPress(_ sender: Any) {
        preferences.category = "Eating"
        print(preferences)
    }
    
    @IBAction func activityButtonPress(_ sender: Any) {
        preferences.category = "Activity"
        print(preferences)
    }
    
    @IBAction func studyButtonPress(_ sender: Any) {
        preferences.category = "Study"
        print(preferences)
    }
    
    @IBAction func distanceSlider(_ sender: UISlider) {
        radiusSlider.minimumValue = 1700
        radiusSlider.maximumValue = 30000
        
        preferences.radius = String(format:"%f",sender.value)
        print(convertToMiles(meters: Double(sender.value)))
        
    }
    
    @IBAction func timePicker(_ sender: Any) {
        preferences.start_time = getStartTime()
        print(preferences)
    }
    
    @IBAction func durationSlider(_ sender: UISlider) {
        timeSlider.minimumValue = 60
        timeSlider.maximumValue = 300
        
        preferences.duration = String(format:"%d", convertToHours(minutes: Int(sender.value)))
        print(convertToHours(minutes: Int(sender.value)))
    }
    
    @IBAction func d1Button(_ sender: Any) {
        preferences.price = "1"
        print(preferences)
    }
    
    @IBAction func d2Button(_ sender: Any) {
        preferences.price = "2"
        print(preferences)
    }
    
    @IBAction func d3Button(_ sender: Any) {
        preferences.price = "3"
        print(preferences)
    }
    
    func getStartTime() -> String
    {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let strDate = dateFormatterGet.string(from: datePicker.date)
        return strDate
    }
    
// ===================================================================================
    
    @IBAction func preferenceSubmit(_ sender: Any) {
        //to show a loading indicator
        //preferenceSubmit.loadingIndicator(true)
        //if submit is success & all data is grabbed & ready, then call this function to open up & display the overview screen stuff :D
        
        //send data
        submissionRequest(payload: preferences)
        //save all options to the preferences class
        
        self.performSegue(withIdentifier: "pref_to_over", sender: self)
    }
    
    func submissionRequest(payload: SubmissionRequest) -> Void
    {
        let test = payload
        
        let testUrl = URL(string: "https://meguzg0s66.execute-api.us-west-1.amazonaws.com/dev/setprefs")!
        
        do {
            var request = URLRequest(url: testUrl, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            request.httpMethod = "POST"
            request.addValue("applications/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONEncoder().encode(test)
            
            let jsonString = String(data: (request.httpBody as Data?)!, encoding: .utf8)!
            print(jsonString)

            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            
            let task = session.dataTask(with: request) { (data, response, error) in
               // This will run when the network request returns
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    print("Response Error")
                    return
                }
    
                
                do {
                    /*
                    let messageData = try JSONDecoder().decode(NewGroupCodeResponse.self, from: jsonData)
                    print(messageData)
                    */
                    
                    //print(String(data: data!, encoding: .utf8)!)
                    let dataDictionary = try! JSONSerialization.jsonObject(with: (data ?? nil)!, options: []) as! [String: Any]
                    
                    print(dataDictionary)
                    
                } catch {
                    print("Decoder Error")
                }
                
                
            }
            task.resume()
        } catch {
            print("Error")
        }
    }
// ===================================================================================
    
    func convertToMiles(meters: Double) -> Int
    {
        return Int(meters/1609.34)
    }
    
    func convertToHours(minutes: Int) -> Int
    {
        return Int(minutes/60)
    }
 
    
}
