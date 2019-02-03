//
//  MainViewController.swift
//  ModelGenerator
//
//  Created by Reza Khalafi on 1/28/19.
//  Copyright © 2019 Reza Khalafi. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet var arrayController: NSArrayController!
    @IBOutlet weak var addButton: NSButton!
    @IBOutlet weak var removeButton: NSButton!
    @IBOutlet weak var generateButton: NSButton!
    var counter:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.action = #selector(addButtonClicked)
        removeButton.action = #selector(removeButtonClicked)
        generateButton.action = #selector(generateButtonClicked)
        arrayController.addObject(getPureObj())
    }

    override func viewWillAppear() {
        super.viewWillAppear()
//        view.window?.styleMask = .fullScreen
        
        
    }
    
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        //Add titlebar
        let window = view.window!
        window.styleMask.remove(NSWindow.StyleMask.unifiedTitleAndToolbar)
        window.styleMask.remove(NSWindow.StyleMask.fullSizeContentView)
        window.styleMask.insert(NSWindow.StyleMask.titled)
        window.toolbar?.isVisible = true
        window.titleVisibility = .hidden
        window.titlebarAppearsTransparent = false
        
        //Resize again
        var windowFrame = window.frame
        windowFrame.size = NSMakeSize(480, 270)
        window.setFrame(windowFrame, display: true)
        
    }
    
    //MARK:Buttons
    @objc func addButtonClicked(sender:NSButton) {
        counter += 1
        arrayController.addObject(getPureObj())
        tableView.reloadData()
    }
    
    @objc func removeButtonClicked(sender:NSButton) {
        if tableView.selectedRow != -1 {
            //Selected mode
            arrayController.remove(atArrangedObjectIndex: tableView.selectedRow)
            counter -= 1
        }else{
            arrayController.remove(atArrangedObjectIndex: counter - 1)
            counter -= 1
            if counter == 0 {
                counter += 1
                arrayController.addObject(getPureObj())
            }
        }
        tableView.reloadData()
    }
    
    @objc func generateButtonClicked(sender:NSButton) {
        if isValid() {
            let vc = self.storyboard?.instantiateController(withIdentifier: "ResultVcId") as! ResultController
            let modelString = Generator().start(ac: arrayController)
            vc.modelString = modelString
            self.presentAsSheet(vc)
        }
    }
    
    //MARK:Method handler
    func getPureObj() -> DataModel {
        return DataModel(counter: counter,name: "", type: "String")
    }
    
    func isValid() -> Bool {
        let dataSourceArr = arrayController.arrangedObjects as! [DataModel]
        var i:Int = 0
        for item in dataSourceArr {
            if item.name == "" { i += 1}
        }
        if i > 0 { return false } else {return true}
    }
    
}//class
