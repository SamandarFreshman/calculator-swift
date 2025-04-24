//
//  ViewController.swift
//  CalcApp
//
//  Created by Sobirjon Qadirov on 22/04/25.
//

import UIKit

class ViewController: UIViewController 
{
    
    @IBOutlet weak var CalculatorWorkings: UILabel!
    @IBOutlet weak var CalculatorResults: UILabel!
    
    var workings:String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll()
    {
        workings = ""
        CalculatorWorkings.text = ""
        CalculatorResults.text = ""
    }
    
    @IBAction func clearAllTap(_ sender: Any) 
    {
        clearAll()
    }
    
    @IBAction func backspaceTap(_ sender: Any)
    {
        if (!workings.isEmpty)
        {
            workings.removeLast()
            CalculatorWorkings.text = workings
        }
    }
    
    func addToWorkings(value: String)
    {
        workings = workings+value
        CalculatorWorkings.text = workings
    }
    
    @IBAction func percentTap(_ sender: Any) 
    {
        addToWorkings(value: "%")
    }
    @IBAction func divideTap(_ sender: Any) 
    {
        addToWorkings(value: "/")
    }
    @IBAction func timesTap(_ sender: Any) 
    {
        addToWorkings(value: "*")
    }
    @IBAction func subtractTap(_ sender: Any) 
    {
        addToWorkings(value: "-")
    }
    @IBAction func addTap(_ sender: Any) 
    {
        addToWorkings(value: "+")
    }
    
    @IBAction func equalsTap(_ sender: Any)
    {
        if (validInput())
        {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            CalculatorResults.text = resultString
        }
        else
        {
            let alert = UIAlertController(title: "Invalid input", message: "Invalid math expression", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        var dotCount = 0
        
        for char in workings
        {
            if char == "." {
                        dotCount += 1
                    }
            if (specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count+=1
        }
        if dotCount > 1 {
                return false
            }
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if (index == 0)
            {
                return false
            }
            if (index == workings.count - 1)
            {
                return false
            }
            if (previous != -1)
            {
                if (index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter(char: Character) -> Bool
    {
        if (char == "*")
        {
            return true
        }
        if (char == "/")
        {
            return true
        }
        if (char == "+")
        {
            return true
        }
        if (char == "-")
        {
            return true
        }
        if (char == "%")
        {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String
    {
        if (result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func decimalTap(_ sender: Any) 
    {
        addToWorkings(value: ".")
    }
    @IBAction func zeroTap(_ sender: Any) 
    {
        addToWorkings(value: "0")
    }
    @IBAction func oneTap(_ sender: Any) 
    {
        addToWorkings(value: "1")
    }
    @IBAction func twoTap(_ sender: Any) 
    {
        addToWorkings(value: "2")
    }
    @IBAction func threeTap(_ sender: Any) 
    {
        addToWorkings(value: "3")
    }
    @IBAction func fourTap(_ sender: Any) 
    {
        addToWorkings(value: "4")
    }
    @IBAction func fiveTap(_ sender: Any) 
    {
        addToWorkings(value: "5")
    }
    @IBAction func sixTap(_ sender: Any) 
    {
        addToWorkings(value: "6")
    }
    @IBAction func sevenTap(_ sender: Any) 
    {
        addToWorkings(value: "7")
    }
    @IBAction func eightTap(_ sender: Any) 
    {
        addToWorkings(value: "8")
    }
    @IBAction func nineTap(_ sender: Any)
    {
        addToWorkings(value: "9")
    }
    
    
    
}

