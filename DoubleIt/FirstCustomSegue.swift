//
//  FirstCustomSegue.swift
//  DoubleIt
//
//  Created by Danial and Harris on 6/26/17.
//  Copyright © 2017 ShadowLord. All rights reserved.
//

import UIKit

class FirstCustomSegue: UIStoryboardSegue {
    var source = self.sourceViewController.view as UIView!
    var main = self.destinationViewController.view as UIView!

    override func perform() {
        main.alpha = 0
        source.alpha = 1.0
        UIView.animate(withDuration: 0.8, animations: { () -> Void in
            source.alpha = 0
            main.alpha = 1.0
            
            
        })
    
}
}
