//
//  TypeMenu.swift
//  ModelGenerator
//
//  Created by Reza Khalafi on 1/28/19.
//  Copyright © 2019 Reza Khalafi. All rights reserved.
//

import Cocoa

class TypeMenu: NSMenu {
    
    private let dataTypes:Array<String> = [
        "String","Int","Bool","Float","Double","Data","Date","CUSTOM"
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        for obj in dataTypes {
            let i = NSMenuItem(title: obj, action: nil, keyEquivalent: "")
            addItem(i)
        }
    }
}//class
