//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func heighSliderChanged(_ sender: UISlider) {
        
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
       
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightSlider.value = 1.5
        weightSlider.value = 100
        
    }

    @IBAction func calculatePresed(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height, weight)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            
        }
    }
}

