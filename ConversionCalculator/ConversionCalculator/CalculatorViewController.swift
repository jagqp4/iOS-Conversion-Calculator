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
    
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        if activeTextField.text != nil{
            activeTextField.text = ""
        }
    }
    @IBAction func pressPlusMinus(_ sender: Any) {
        if var activeValue = activeTextField.text{
            if activeValue[activeValue.startIndex] == "-"{
                activeValue.remove(at: activeValue.startIndex)
                activeTextField.text = activeValue
            }
            else{
                activeValue.insert("-", at: activeValue.startIndex)
                activeTextField.text = activeValue
            }
        }
        
    }
    @IBAction func pressBackspace(_ sender: Any) {
        if var activeValue = activeTextField.text{
            if activeValue != ""{
                activeValue.remove(at: activeValue.index(before: activeValue.endIndex))
                activeTextField.text = activeValue
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
