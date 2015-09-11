//
//  ViewController.swift
//  Tipster
//
//  Created by Cameron Norgate on 9/11/15.
//  Copyright (c) 2015 Cameron Norgate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalpLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalpLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditChanged(sender: AnyObject) {
        //Create an array so you can call those numbers
        var tipPercentages = [0.1,0.15,0.2]
        // Define the actual percentage as a function of the segment
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        //println("User editing Bill")
        // Get a decimal value
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip


        
        // Included this here to get the right styling for my numbers
        // http://stackoverflow.com/questions/31021197/how-to-add-commas-to-a-number-in-swift
        var numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        
        
        //tipLabel.text = "$\(tip)"
        //totalpLabel.text = "$\(total)"
        
        //tipLabel.text = String(format: "$%.2f", tip)
        //numberFormatter.stringFromNumber(largeNumber)!
        tipLabel.text = numberFormatter.stringFromNumber(tip)!
        totalpLabel.text = numberFormatter.stringFromNumber(total)!
        
        
        
    }

    // Move the keyboard away on any tap event
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

