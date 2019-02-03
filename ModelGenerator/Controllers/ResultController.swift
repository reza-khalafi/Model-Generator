//
//  ResultController.swift
//  ModelGenerator
//
//  Created by Reza Khalafi on 1/27/19.
//  Copyright © 2019 Reza Khalafi. All rights reserved.
//

import Cocoa

class ResultController: NSViewController {


    @IBOutlet var resultText: NSTextView!
    @IBOutlet weak var doneButton: NSButton!
    var modelString:String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.action = #selector(doneButtonClicked)
        resultText.string = modelString
        
    }
    
    
    //MARK:Buttons
    @objc func doneButtonClicked(sender:NSButton) {
        dismiss(nil)
    }
}//class
