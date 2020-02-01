//
//  MainMenuViewController.swift
//  Where2Meet
//
//  Created by Angelo Domingo on 2/1/20.
//  Copyright © 2020 Angelo Domingo. All rights reserved.
//

import UIKit
import CoreLocation

class MainMenuViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var codeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "home_bg.png")!)
    
    }
    
    @IBAction func sendCode(_ sender: Any) {
        getCodeField(code: codeField.text ?? "Invalid" )
    }
    
    @IBAction func generateCode(_ sender: Any) {
        getLocation()
    }
    
    func getCodeField(code: String) -> String{
        print(code)
        let userCode = code
        return userCode
    }
    
    func getLocation()
    {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        
        //locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        
        var currentLoc: CLLocation!
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
        CLLocationManager.authorizationStatus() == .authorizedAlways) {
           currentLoc = locationManager.location
           print(currentLoc.coordinate.latitude)
           print(currentLoc.coordinate.longitude)
        }
        else
        {
            print("nothing")
        }
    }
    
    /*
    func buildCode(device_id: String, code: String, )
    {
        
    }
    */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
