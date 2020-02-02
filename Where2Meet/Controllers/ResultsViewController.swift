//
//  ResultsViewController.swift
//  Where2Meet
//
//  Created by Angelo Domingo on 2/2/20.
//  Copyright © 2020 Angelo Domingo. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {

    var places = [[String: Any]]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        tableView.dataSource = self
        tableView.delegate = self

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "alt_bg.png")!)

        
        // Do any additional setup after loading the view.
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell") as! PlacesCell
        
        let place = places[indexPath.row]
        
        cell.placeTitle.text = place["name"] as? String
        cell.addressLabel.text = place["formatted_address"] as? String
        cell.starsLabel.text = place["rating"] as? String
        cell.votesLabel.text = place["votes"] as? String
        
        return cell
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
