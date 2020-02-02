//
//  PlacesCell.swift
//  Where2Meet
//
//  Created by Angelo Domingo on 2/2/20.
//  Copyright © 2020 Angelo Domingo. All rights reserved.
//

import UIKit

class PlacesCell: UITableViewCell {

    
    @IBOutlet weak var placeTitle: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var voteButton: UIButton!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        //ceself.backgroundColor = UIColor.red
        //self.layer.cornerRadius = self.frame.height / 4
        
        // Configure the view for the selected state
    }

    @IBAction func vote(_ sender: Any) {
        //send vote
    }
}
