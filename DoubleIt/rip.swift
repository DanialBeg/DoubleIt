//
//  rip.swift
//  DoubleIt
//
//  Created by Harris on 6/25/17.
//  Copyright © 2017 ShadowLord. All rights reserved.
//

import UIKit

class die: UIViewController {
    
    @IBOutlet weak var laberinto: UILabel!
   
    @IBOutlet weak var lol: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    var text = String()
    var points = String()
    override func viewDidLoad() {
                // Do any additional setup after loading the view, typically from a nib.
        pointsLabel.text = points
        lol.text = text
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doRestart(_ sender: Any) {
        self.performSegue(withIdentifier: "restart", sender: nil)
    }
    
  
    
}

