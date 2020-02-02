//
//  PreferenceViewController.swift
//  Where2Meet
//
//  Created by Rebekah Li on 2/1/20.
//  Copyright © 2020 Angelo Domingo. All rights reserved.
//

import UIKit

class PreferenceViewController: UIViewController {
    
    /*
    var userPreferences = SubmissionRequest(
        device_id: "",
        code: "",
        lat: "",
        lng:  "",
        radius: "",
        category: "",
        price: "",
        start_time: "",
        duration: "")
    */
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "alt_bg.png")!)
        //code in case I wanna use extension to apply button design:
        //preferenceSubmit.applyDesign()

    }
    
    @IBAction func eatingButtonPress(_ sender: Any) {
        
    }
    
    @IBAction func activityButtonPress(_ sender: Any) {
        
    }
    
    @IBAction func studyButtonPress(_ sender: Any) {
        
    }
    
    @IBAction func distanceSlider(_ sender: Any) {
        
    }
    
    @IBAction func timePicker(_ sender: Any) {
        
    }
    
    @IBAction func durationSlider(_ sender: Any) {
        
    }
    
    @IBAction func d1Button(_ sender: Any) {
        
    }
    
    @IBAction func d2Button(_ sender: Any) {
        
    }
    
    @IBAction func d3Button(_ sender: Any) {
        
    }
    
    @IBAction func preferenceSubmit(_ sender: Any) {
        //to show a loading indicator
        //preferenceSubmit.loadingIndicator(true)
        //if submit is success & all data is grabbed & ready, then call this function to open up & display the overview screen stuff :D
        
        
        //save all options to the preferences class
        
        self.performSegue(withIdentifier: "pref_to_over", sender: self)
    }

}
