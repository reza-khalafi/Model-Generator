//
//  Go.swift
//  ModelGenerator
//
//  Created by Reza Khalafi on 1/29/19.
//  Copyright © 2019 Reza Khalafi. All rights reserved.
//

import Cocoa

class CUSTOM_CLASS: NSObject,NSCoding {
    
    var ID:String?
    var name:String?
    
    init(
        ID:String,
        name:String
        ) {
        self.ID = ID
        self.name = name
    }
    
    //DECODE
    required convenience init?(coder decoder: NSCoder) {
        guard let ID = decoder.decodeObject(forKey: "ID") as? String else { return nil }
        guard let name = decoder.decodeObject(forKey: "name") as? String else { return nil }
        
        self.init(
            ID:ID,
            name:name
        )
    }
    
    //ENCODE
    func encode(with aCoder: NSCoder) {
        aCoder.encode("ID", forKey:ID!)
        aCoder.encode("name", forKey:name!)
    }
    
}//class

