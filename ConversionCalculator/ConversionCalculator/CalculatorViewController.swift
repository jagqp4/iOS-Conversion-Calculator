//
//  CalculatorViewController.swift
//  ConversionCalculator
//
//  Created by Jordan Gunter on 7/25/17.
//  Copyright © 2017 Jordan Gunter. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var activeTextField: UITextField!
    @IBOutlet weak var activeLabel: UILabel!
    
    @IBOutlet weak var convertedTextField: UITextField!
    @IBOutlet weak var convertedLabel: UILabel!
    
    var convertingFrom = Unit(name: "Fahrenheit", strValue: "0")
    
    @IBOutlet weak var unitToggle: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        convertedTextField.text = "0"
        let attr = NSDictionary(object: UIFont(name: "Helvetica", size: 20.0)!, forKey: NSFontAttributeName as NSCopying)
        unitToggle.setTitleTextAttributes(attr as [NSObject : AnyObject] , for: .normal)
        unitToggle.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: UIControlState.selected)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressToggle(_ sender: Any) {
        let newBottomLabel = convertedLabel.text
        convertedLabel.text = activeLabel.text
        activeLabel.text = newBottomLabel
        
        let newBottomText = convertedTextField.text
        convertedTextField.text = activeTextField.text
        activeTextField.text = newBottomText
        
        let newIndex = unitToggle.selectedSegmentIndex
        if let newName = unitToggle.titleForSegment(at: newIndex){
            convertingFrom = Unit(name: newName, strValue: activeTextField.text!)
        }
    }
    
    
    @IBAction func unitSelection(_ sender: Any) {
        let alert = UIAlertController(title: "Select Units" , message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alert.addAction(UIAlertAction(title: "Fahrenheit - Celsius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.unitToggle.selectedSegmentIndex = 0
            self.unitToggle.setTitle("Fahrenheit", forSegmentAt: 0)
            self.unitToggle.setTitle("Celsius", forSegmentAt: 1)
            self.activeLabel.text = "°F"
            self.convertedLabel.text = "°C"
            self.convertingFrom = Unit(name: "Fahrenheit", strValue: "0")
        }))
        alert.addAction(UIAlertAction(title: "Miles - Kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.unitToggle.selectedSegmentIndex = 0
            self.unitToggle.setTitle("Miles", forSegmentAt: 0)
            self.unitToggle.setTitle("Kilometers", forSegmentAt: 1)
            self.activeLabel.text = "mi"
            self.convertedLabel.text = "km"
            self.convertingFrom = Unit(name: "Miles", strValue: "0")
        }))
        alert.addAction(UIAlertAction(title: "Yards - Meters", style:UIAlertActionStyle.default, handler: {
            (UIAlertAction) -> Void in
            self.unitToggle.selectedSegmentIndex = 0
            self.unitToggle.setTitle("Yards", forSegmentAt: 0)
            self.unitToggle.setTitle("Meters", forSegmentAt: 1)
            self.activeLabel.text = "yd"
            self.convertedLabel.text = "m"
            self.convertingFrom = Unit(name: "Yards", strValue: "0")
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateActiveValue(_ new : String){
        if let currValue = activeTextField.text{
            if currValue == "0", new != "." {
                activeTextField.text = new
            }
            else{
                activeTextField.text = (currValue + new)
            }
        }
        else{
            activeTextField.text = new
        }
        updateConversionValue()
    }
    
    func updateConversionValue(){
        convertingFrom.value = Double(activeTextField.text!)
        convertedTextField.text = String(describing: convertingFrom.convert())
    }
   
    @IBAction func pressButton0(_ sender: Any) {
        if let currValue = activeTextField.text{
            if currValue != "0" {
                //don't want numbers starting with multiple 0's
                updateActiveValue("0")
            }
        }
    }
    @IBAction func pressButton1(_ sender: Any) {
        updateActiveValue("1")
    }
    @IBAction func pressButton2(_ sender: Any) {
        updateActiveValue("2")
    }
    @IBAction func pressButton3(_ sender: Any) {
        updateActiveValue("3")
    }
    @IBAction func pressButton4(_ sender: Any) {
        updateActiveValue("4")
    }
    @IBAction func pressButton5(_ sender: Any) {
        updateActiveValue("5")
    }
    @IBAction func pressButton6(_ sender: Any) {
        updateActiveValue("6")
    }
    @IBAction func pressButton7(_ sender: Any) {
        updateActiveValue("7")
    }
    @IBAction func pressButton8(_ sender: Any) {
        updateActiveValue("8")
    }
    @IBAction func pressButton9(_ sender: Any) {
        updateActiveValue("9")
    }
   
    @IBAction func pressDecimal(_ sender: Any) {
        if var activeValue = activeTextField.text{
            for character in activeValue.characters{
                if character == "."{
                    return
                }
            }
            updateActiveValue(".")
        }
    }
    
    @IBAction func pressClear(_ sender: Any) {
        activeTextField.text = ""
        convertedTextField.text = ""
    }
    @IBAction func pressPlusMinus(_ sender: Any) {
        if var activeValue = activeTextField.text{
            if activeValue.characters.count >= 1{
                if activeValue[activeValue.startIndex] == "-"{
                    activeValue.remove(at: activeValue.startIndex)
                    activeTextField.text = activeValue
                }
                else{
                    activeValue.insert("-", at: activeValue.startIndex)
                    activeTextField.text = activeValue
                }
                updateConversionValue()
            }
        }
    }
    @IBAction func pressBackspace(_ sender: Any) {
        if var activeValue = activeTextField.text{
            if activeValue != "" {
                activeValue.remove(at: activeValue.index(before: activeValue.endIndex))
                activeTextField.text = activeValue
                updateConversionValue()
            }
        }
    }
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
