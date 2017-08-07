//
//  customSeg.swift
//  DoubleIt
//
//  Created by Danial and Harris on 6/26/17.
//  Copyright © 2017 ShadowLord. All rights reserved.
//

import UIKit

class customSeg: UIStoryboardSegue {
    override func perform() {
        let src = source as UIViewController
        let dest = destination as UIViewController
        let window = UIApplication.shared.keyWindow!
        
        destination.view.alpha = 0.0
        window.insertSubview(dest.view, belowSubview: src.view)
        
        UIView.animate(withDuration: 0.75, animations: { () -> Void in
            src.view.alpha = 0.0
            dest.view.alpha = 1.0
        }) { (finished) -> Void in
            src.view.alpha = 1.0
            src.present(dest, animated: false, completion: nil)
        }
    }
}
