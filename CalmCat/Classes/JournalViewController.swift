//
//  JournalViewController.swift
//  CalmCat
//
//  Created by Hana Clements on 7/29/19.
//  Copyright © 2019 Hana Clements. All rights reserved.
//

import SpriteKit
import UIKit

class JournalFiveViewController: UIViewController {
    
    @IBOutlet weak var inputA: UITextField!
    @IBOutlet weak var inputB: UITextField!
    @IBOutlet weak var inputC: UITextField!
    @IBOutlet weak var inputD: UITextField!
    @IBOutlet weak var inputE: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func nextTapped(_ sender: Any) {
        textView.text = "1. \(inputA.text)\n2. \(inputB.text)\n3. \(inputC.text)\n3. \(inputD.text)\n4. \(inputE.text)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        inputA.resignFirstResponder()
        inputB.resignFirstResponder()
        inputC.resignFirstResponder()
        inputD.resignFirstResponder()
        inputE.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputA.delegate = self
        inputB.delegate = self
        inputC.delegate = self
        inputD.delegate = self
        inputE.delegate = self
    }
    
}

extension JournalViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        }
}
