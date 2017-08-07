//
//  ViewController.swift
//  DoubleIt
//
//  Created by Harris on 6/25/17.
//  Copyright © 2017 ShadowLord. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var hs = Int()
    var wrongortime = String()
    var counter = 0
    var timer = Timer()
    var pts = 0
    var mainColor = UIColor()
    @IBOutlet weak var highS: UILabel!
    @IBOutlet weak var initialNum: UILabel!
    @IBOutlet weak var entry: UITextField!
    @IBOutlet weak var timeT: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hue: 0.5444, saturation: 0.57, brightness: 0.98, alpha: 1.0)
        let VidhurHatesApple = arc4random_uniform(63) + 1
        initialNum.text = String(VidhurHatesApple)
        entry.delegate = self
        view.alpha = 1.0
      
       // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let webst = segue.destination as! die
        webst.points = "You earned \(pts) points!"
        webst.text = wrongortime

    }
    
    
    @IBAction func ButtonDouble(_ sender: Any) {
        
        let entryn = Int(entry.text!)
        let check = Int(initialNum.text!)
        
        
        
        
        if entryn != nil {
        if entryn! == check!*2 {
            timer.invalidate()
            self.counter = 0
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateCounter)), userInfo: nil, repeats: true)

            
            self.mainColor = UIColor.white
            self.pts = self.pts + 1
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                self.view.backgroundColor = UIColor.green
                
            }) { (finished) -> Void in
                self.view.backgroundColor = UIColor(hue: 0.5444, saturation: 0.57, brightness: 0.98, alpha: 1.0)
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                self.initialNum.text = String(entryn! * 2)
                self.initialNum.textColor = self.mainColor
                
            

                
                if (self.pts > self.hs) {
                    self.mainColor = UIColor.yellow
                    
                    self.highS.text = "High score : \(self.pts)"
                    UserDefaults.standard.set(String(self.pts), forKey: "points")
                }
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateCounter)), userInfo: nil, repeats: true)
                
            }
        }
        
        
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                self.performSegue(withIdentifier: "Viddy", sender: nil)
            }
            self.wrongortime = "Wrong!"

            self.view.backgroundColor = UIColor.red
            
        }
            }
            else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                    self.performSegue(withIdentifier: "Viddy", sender: nil)
                }
                self.wrongortime = "Wrong!"
                
                self.view.backgroundColor = UIColor.red
                
            }


        
        
    }
    func updateCounter() {
        counter = counter + 1
        timeT.text = "Time: \(counter)"
         if Double(counter) > (20 / Double(pts)) {
            timeT.textColor = UIColor.red
            wrongortime = "Time's up!"
            
            self.performSegue(withIdentifier: "Viddy", sender: nil)

        }
    }
    
    func saveHighScore() {
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let x = UserDefaults.standard.object(forKey: "points") as? String {
            highS.text = "High score: " + x
            hs = Int(x)!
            

        }
        
        
        
        UIView.animate(withDuration: 0.75, animations: {
            self.view.alpha = 1.0
        })
    }
     func textFieldShouldReturn(_ entry: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
}

