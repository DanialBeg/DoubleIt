
//
//  Start.swift
//  DoubleIt
//
//  Created by Harris on 6/26/17.
//  Copyright © 2017 ShadowLord. All rights reserved.
//

import Foundation
import UIKit

class Start: UIViewController {
    
    
    
    
    @IBOutlet weak var text: UILabel!
    
    override func viewDidLoad() {
        self.view.alpha = 1.0
        // Do any additional setup after loading the view, typically from a nib.
        text.text = "3"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.text.text = "2"
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                self.text.text = "1"
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                    self.performSegue(withIdentifier: "homeRun", sender: nil)
                    
                }
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        UIView.animate(withDuration: 0.75, animations: {
            self.view.alpha = 0.0
        })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
