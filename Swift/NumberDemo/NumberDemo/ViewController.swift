//
//  ViewController.swift
//  NumberDemo
//
//  Created by Peyet-Zhao on 2021/8/25.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var intNumber: Int = 0
    var doubleNumber: Double = 0
    var step:Int = 1
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("initialization successful!")
        label.text = "Int: \(intNumber)\nDouble: \(doubleNumber)"
        
        button.setTitle("+\(step)", for: .normal)
        button2.setTitle("-\(step)", for: .normal)
//      let title = step > 0 ? "+\(step)" : "-\(step)"
        
    }
    
    @IBAction func clickBotton(_ sender: UIButton) {
        print("click button1")
//        intNumber = intNumber + step
//        doubleNumber = doubleNumber + Double(step)
        intNumber += step
        doubleNumber += Double(step)
        label.text = "Int: \(intNumber)\nDouble: \(doubleNumber)"
        print("intNumber = \(intNumber), doubleNumber = \(doubleNumber)")
    }

    @IBAction func clickButton2(_ sender: UIButton) {
        print("click button2")
//        intNumber = intNumber - step
//        doubleNumber = doubleNumber - Double(step)
        intNumber -= step
        doubleNumber -= Double(step)

        label.text = "Int: \(intNumber)\nDouble: \(doubleNumber)"
        print("intNumber = \(intNumber), doubleNumber = \(doubleNumber)")
    }
    
    

}

