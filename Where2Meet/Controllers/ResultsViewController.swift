//
//  ResultsViewController.swift
//  Where2Meet
//
//  Created by Angelo Domingo on 2/2/20.
//  Copyright © 2020 Angelo Domingo. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var places = [String:[String: Any]]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "alt_bg.png")!)

        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
