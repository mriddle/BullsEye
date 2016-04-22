//
//  ViewController.swift
//  BullsEye
//
//  Created by Matthew Riddle on 21/04/2016.
//  Copyright © 2016 Matthew Riddle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Happy Friday",
            message: "Ferocia is more than great",
            preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "Awesome", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
}

