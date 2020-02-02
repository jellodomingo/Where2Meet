//
//  ResultsViewController.swift
//  Where2Meet
//
//  Created by Angelo Domingo on 2/2/20.
//  Copyright © 2020 Angelo Domingo. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var places = [[String: Any]]()

    
    @IBOutlet weak var placeTitle1: UILabel!
    @IBOutlet weak var typeImage1: UIImageView!
    @IBOutlet weak var addressLabel1: UILabel!
    @IBOutlet weak var priceLabel1: UIImageView!
    @IBOutlet weak var ratingLabel1: UILabel!
    
    @IBOutlet weak var placeTitle2: UILabel!
    @IBOutlet weak var typeImage2: UIImageView!
    @IBOutlet weak var priceLabel2: UIImageView!
    @IBOutlet weak var ratingLabel2: UILabel!
    @IBOutlet weak var addressLabel2: UILabel!
    
    
    @IBOutlet weak var placeTitle3: UILabel!
    @IBOutlet weak var typeImage3: UIImageView!
    @IBOutlet weak var priceLabel3: UIImageView!
    @IBOutlet weak var addressLabel3: UILabel!
    @IBOutlet weak var ratingLabel3: UILabel!
    
    @IBOutlet weak var tile1: UIView!
    @IBOutlet weak var tile2: UIView!
    @IBOutlet weak var tile3: UIView!
    @IBOutlet weak var gradientBG: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "alt_bg.png")!)

        tile1.layer.cornerRadius = tile1.frame.height / 4
        tile2.layer.cornerRadius = tile1.frame.height / 4
        tile3.layer.cornerRadius = tile1.frame.height / 4
        
        
        view.sendSubviewToBack(tile1)
        view.sendSubviewToBack(tile2)
        view.sendSubviewToBack(tile3)
        view.sendSubviewToBack(gradientBG)
        
        // Do any additional setup after loading the view.
        
    }
    
    func changeViewOne()
    {
        
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
