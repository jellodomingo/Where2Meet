//
//  PreferenceViewController.swift
//  Where2Meet
//
//  Created by Rebekah Li on 2/1/20.
//  Copyright © 2020 Angelo Domingo. All rights reserved.
//

import UIKit

class PreferenceViewController: UIViewController {

    @IBOutlet weak var preferenceSubmit: UIButton!
    
    @IBOutlet weak var eatingButton: UIButton!
    @IBOutlet weak var activityButton: UIButton!
    @IBOutlet weak var studyingButton: UIButton!
    
    @IBOutlet weak var distanceSlider: UISlider!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var durationSlider: UISlider!
    
    @IBOutlet weak var d1Button: UIButton!
    @IBOutlet weak var d2Button: UIButton!
    @IBOutlet weak var d3Button: UIButton!
    @IBOutlet weak var d4Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "alt_bg.png")!)
        //code in case I wanna use extension to apply button design:
        //preferenceSubmit.applyDesign()

    }
    
    @IBAction func preferenceSubmit(_ sender: Any) {
        //to show a loading indicator
        preferenceSubmit.loadingIndicator(true)
        //if submit is success & all data is grabbed & ready, then call this function to open up & display the overview screen stuff :D
        
        
        //save all options to the preferences class
        
        self.performSegue(withIdentifier: "pref_to_over", sender: self)
    }

}
