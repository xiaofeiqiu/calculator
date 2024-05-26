//
//  ViewController.swift
//  calculator
//
//  Created by dev on 5/25/24.
//

import UIKit

class ViewController: UIViewController {
    
    var tapped: [String] = []
    var nums: [Float] = []
    var dotSeen: Bool = false
    var sign = ""
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var expLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttontapped(_ sender: UIButton) {
        
        guard let num = sender.titleLabel?.text else { return }
        
        if dotSeen && num == "." {
            return
        }
        
        if !dotSeen && num == "." {
            dotSeen = true
        }
        
        tapped.append(num)
        inputLabel.text = tapped.joined()
    }
    
    @IBAction func clear(_ sender: UIButton) {
        inputLabel.text = "0"
        expLabel.text = ""
        tapped = []
        nums = []
        dotSeen = false
    }
    
    
    @IBAction func sign(_ sender: UIButton) {
        guard let s = sender.titleLabel?.text else { return }
        
        if let i = Float(tapped.joined()) {
            nums.append(i)
        }
        sign = s
        expLabel.text = tapped.joined() + " " + sign
        tapped = []
        inputLabel.text = "0"
        dotSeen = false
    }
    
    @IBAction func equal(_ sender: UIButton) {
        
        if let i = Float(tapped.joined()) {
            nums.append(i)
        }
        
        if sign == "" {
            return
        }
        guard let exp = expLabel.text else {
            return
        }
        expLabel.text = exp + " " + tapped.joined()
        
        
        var res:Float = 0.0
        switch sign {
        case "+":
            res = nums[0] + nums[1]
        case "-":
            res = nums[0] - nums[1]
        case "x":
            res = nums[0] * nums[1]
        case "/":
            res = nums[0] / nums[1]
        case "%":
            res = nums[0].truncatingRemainder(dividingBy: nums[1])
        default:
            return
        }
        
        print("\(nums[0]) + \(nums[1]) = \(res)")
        nums = []
        tapped = []
        tapped.append(String(res))
        inputLabel.text=String(res)
        sign = ""
        dotSeen = false
    }
}

