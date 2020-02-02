//
//  GeneratedCodeViewController.swift
//  Where2Meet
//
//  Created by Rebekah Li on 2/1/20.
//  Copyright © 2020 Angelo Domingo. All rights reserved.
//

import UIKit

class GeneratedCodeViewController: UIViewController {
    
    @IBOutlet weak var codeBG: UIView!
    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var codeLabel: UILabel!
    
    var code: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        codeLabel.textAlignment = .center
        codeLabel.text = code
        
        //sets bg image
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "home_bg.png")!)
        
        //shapes the bg of code display & copy code button
        //rounding & changing color of code text field
        codeBG.layer.cornerRadius = codeBG.frame.height / 4
        copyButton.applyDesign()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func copyButton(_ sender: Any) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = code
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
