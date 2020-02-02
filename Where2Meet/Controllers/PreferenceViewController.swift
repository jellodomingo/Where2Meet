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
        
        print(preferences)
            
        
        //code in case I wanna use extension to apply button design:
        //eatingButton.applyDesign()
    }
    
    @IBAction func eatingButtonPress(_ sender: Any) {
        preferences.type = "Eating"
        print(preferences)
    }
    
    @IBAction func activityButtonPress(_ sender: Any) {
        preferences.type = "Activity"
        print(preferences)
    }
    
    @IBAction func studyButtonPress(_ sender: Any) {
        preferences.type = "Study"
        print(preferences)
    }
    
    @IBAction func distanceSlider(_ sender: UISlider) {
        preferences.radius = String(format:"%d",Int(sender.value*30))
        print(Int(sender.value*30))
    }
    
    @IBAction func timePicker(_ sender: Any) {
        
    }
    
    @IBAction func durationSlider(_ sender: UISlider) {
        preferences.duration = String(format:"%d",Int(sender.value*300))
        print(Int(sender.value*300))
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
    
    @IBAction func preferenceSubmit(_ sender: Any) {
        //to show a loading indicator
        //preferenceSubmit.loadingIndicator(true)
        //if submit is success & all data is grabbed & ready, then call this function to open up & display the overview screen stuff :D
        
        
        //save all options to the preferences class
        
        self.performSegue(withIdentifier: "pref_to_over", sender: self)
    }

}
