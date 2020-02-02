//
//  MainMenuViewController.swift
//  Where2Meet
//
//  Created by Angelo Domingo on 2/1/20.
//  Copyright © 2020 Angelo Domingo. All rights reserved.
//

import UIKit
import CoreLocation
import NetworkExtension

class MainMenuViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var logoDisplay: UIImageView!
    @IBOutlet weak var generateCodeButton: UIButton!
    @IBOutlet weak var codeSubmitButton: UIButton!
    
    var EntryCode: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "home_bg.png")!)
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
        
        //move screen when keyboard appears
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //rounding & changing color of code text field
        codeField.layer.cornerRadius = codeField.frame.height / 2
        codeField.layer.borderWidth = 1.0
        codeField.layer.borderColor = UIColor.red.cgColor
        codeField.attributedPlaceholder = NSAttributedString(string: "ENTER A CODE",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func getLocation() -> Location {
        var currentLoc: CLLocation!
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
        CLLocationManager.authorizationStatus() == .authorizedAlways) {
            currentLoc = locationManager.location
            print(currentLoc.coordinate.latitude)
            print(currentLoc.coordinate.longitude)
            
            return Location(lat: currentLoc.coordinate.latitude, lng: currentLoc.coordinate.longitude)
        }
        else
        {
            print("nothing")
            return Location(lat: 0, lng: 0)
        }
    }
    
// ===================================================================================
    
    //ENTER CODE BUTTON
    @IBAction func sendCode(_ sender: Any) {
        let code = getCodeField(code: codeField.text ?? "Invalid" )
        self.EntryCode = code
    
        
        let request = ExistingGroupCodeRequest(device_id: getWiFiAddress() ?? "", code: code)
        
        getPrefsRequest(payload: request)
        
        //TODO: gotta go to respective screen based on if people submitted prefs
        
        
        self.performSegue(withIdentifier: "main_enterCode", sender: self)
    }
    
    func getCodeField(code: String) -> String{
        print(code)
        let userCode = code
        return userCode
    }
    
    func getPrefsRequest(payload: ExistingGroupCodeRequest) -> Void
    {
        let test = payload
        
        let testUrl = URL(string: "https://meguzg0s66.execute-api.us-west-1.amazonaws.com/dev/existing")!
        
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
                    let messageData = try JSONDecoder().decode(PreferencesResponse.self, from: jsonData)
                    print(messageData)
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
    
    //GENERATE CODE BUTTON
    //Gets a new code for the room
    @IBAction func generateCode(_ sender: Any) {
        
        generateCodeButton.loadingIndicator(true)
        
        let code = getIPAddress()
        
        do {
            let data = try JSONEncoder().encode(code)
        
            let jsonString = String(data: (data as Data?)!, encoding: .utf8)!
            print(jsonString)
            
            //Calls the generate endpoint
            generateCodeRequest(payload: code)
            
            
        
        } catch {
            print("Error")
        }
        
        
    }
    
    // Return IP address of WiFi interface (en0) as a String, or `nil`
    func getWiFiAddress() -> String? {
        var address : String?

        // Get list of all interfaces on the local machine:
        var ifaddr : UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return nil }
        guard let firstAddr = ifaddr else { return nil }

        // For each interface ...
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee

            // Check for IPv4 or IPv6 interface:
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {

                // Check interface name:
                let name = String(cString: interface.ifa_name)
                if  name == "en0" {

                    // Convert interface address to a human readable string:
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                &hostname, socklen_t(hostname.count),
                                nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                }
            }
        }
        freeifaddrs(ifaddr)

        return address
    }
    
    //Get IPAddress
    func getIPAddress() -> NewGroupCodeRequest {
        return NewGroupCodeRequest(device_id: getWiFiAddress() ?? "")
    }
    
    
    func generateCodeRequest(payload: NewGroupCodeRequest) -> Void
    {
        
        let test = payload
        
        let testUrl = URL(string: "https://meguzg0s66.execute-api.us-west-1.amazonaws.com/dev/generate")!
        
        do {
            var request = URLRequest(url: testUrl, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            request.httpMethod = "GET"

            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
            
            
            let task = session.dataTask(with: request) { (data, response, error) in
               // This will run when the network request returns

                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    print("Response Error")
                    return
                }
    
                
                do {
                    let messageData = try JSONDecoder().decode(NewGroupCodeResponse.self, from: jsonData)
                    
                    print(messageData.code)
                    self.EntryCode = messageData.code
                    self.performSegue(withIdentifier: "home_to_displaycode", sender: self)
                
                    
                } catch {
                    print("Decoder Error")
                }
            }
            task.resume()
            
            
            
        } catch {
            print("Error")
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "main_enterCode")
        {
            let prefViewsController = segue.destination as! PreferenceViewController
            
            prefViewsController.code = self.EntryCode
            prefViewsController.device_id = getWiFiAddress() ?? ""
            prefViewsController.location = getLocation()
        }
        else if(segue.identifier == "home_to_displaycode")
        {
            let displayCodeController = segue.destination as! GeneratedCodeViewController
            
            displayCodeController.code = self.EntryCode
        }
    }

    
}
