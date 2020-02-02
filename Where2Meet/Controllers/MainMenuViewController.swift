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
        
        //move screen when keyboard appears
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func sendCode(_ sender: Any) {
        //getCodeField(code: codeField.text ?? "Invalid" )
        
        //TODO: gotta go to respective screen based on if people submitted prefs
        self.performSegue(withIdentifier: "main_enterCode", sender: self)
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
