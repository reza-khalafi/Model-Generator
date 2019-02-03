//
//  DataModel.swift
//  ModelGenerator
//
//  Created by Reza Khalafi on 1/28/19.
//  Copyright © 2019 Reza Khalafi. All rights reserved.
//

import Cocoa

class DataModel: NSObject {
    @objc var counter:Int
    @objc var name:String
    @objc var type:String
    
    init(counter:Int,name:String,type:String) {
        self.counter = counter
        self.name = name
        self.type = type
    }
}//class
