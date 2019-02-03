//
//  Generator.swift
//  ModelGenerator
//
//  Created by Reza Khalafi on 1/28/19.
//  Copyright © 2019 Reza Khalafi. All rights reserved.
//

import Cocoa

class Generator: NSObject {
    func start(ac:NSArrayController) -> String {
        let dataSourceArr = ac.arrangedObjects as! [DataModel]

        var finalString:String = ""
        
        let classStartString = "class CUSTOM_CLASS: NSObject,NSCoding {\n\n"
        finalString.append(classStartString)
        
        for item in dataSourceArr {
            let varString = "    var " + item.name + ":" + item.type + "?\n"
            finalString.append(varString)
        }
        
        let startInitConstructorString = "\n    init(\n    "
        finalString.append(startInitConstructorString)
        
        for (i,item) in dataSourceArr.enumerated() {
            var varInitConstructorString = "        " + item.name + ":" + item.type
            if i != dataSourceArr.count - 1 {
                varInitConstructorString += ","
            }
            varInitConstructorString += "\n"
            finalString.append(varInitConstructorString)
        }
        
        let endInitConstructorString = "    ) {\n    "
        finalString.append(endInitConstructorString)
        
        for item in dataSourceArr {
            let varInitString = "        self." + item.name + " = " + item.name + "\n"
            finalString.append(varInitString)
        }
        
        let endInitString = "    }\n"
        finalString.append(endInitString)
        
        let startDecoderString = "\n    //DECODE\n       required convenience init?(coder decoder: NSCoder) {\n "
        finalString.append(startDecoderString)
        
        for item in dataSourceArr {
            let guardString = "        guard let " + item.name + " = decoder.decodeObject(forKey: " + "\"" + item.name + "\") as? " + item.type + " else { return nil }\n"
            finalString.append(guardString)
        }
        
        let decoderStartInitString = "\n    self.init(\n"
        finalString.append(decoderStartInitString)
        
        for (i,item) in dataSourceArr.enumerated()  {
            var decoderVarString = "        " + item.name + ":" + item.name
            if i != dataSourceArr.count - 1 {
                decoderVarString += ","
            }
            decoderVarString += "\n"
            finalString.append(decoderVarString)
        }
        
        let decoderEndInitString = "            )\n    }\n"
        finalString.append(decoderEndInitString)
        
        let startEncoderString = "\n    //ENCODE\n       func encode(with aCoder: NSCoder) {\n "
        finalString.append(startEncoderString)
        
        for item in dataSourceArr {
            let encoderVarString = "        aCoder.encode(\"" + item.name + "\", forKey:" + item.name + "!)\n"
            finalString.append(encoderVarString)
        }
        
        let endEncoderString = "    }\n\n"
        finalString.append(endEncoderString)
        
        let classEndString = "}//class"
        finalString.append(classEndString)
print(finalString)
        return finalString
    }
}//class
