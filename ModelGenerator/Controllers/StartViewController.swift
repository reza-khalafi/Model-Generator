//
//  StartViewController.swift
//  ModelGenerator
//
//  Created by Reza Khalafi on 1/29/19.
//  Copyright © 2019 Reza Khalafi. All rights reserved.
//

import Cocoa

class StartViewController: NSViewController {

    @IBOutlet weak var splashImageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.

        splashImageView.image = NSImage(named: "splash")
        self.splashImageView.alphaValue = 0.0
        NSAnimationContext.runAnimationGroup({ (context:NSAnimationContext) in
            context.duration = 3;
            splashImageView.animator().alphaValue = 1;
        }) {
            self.splashImageView.alphaValue = 1.0
            let vc = self.storyboard?.instantiateController(withIdentifier: "MainVcId") as! MainViewController
            self.view.window?.contentViewController = vc
            
        }
        
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()

        //Remove titlebar
        let window = view.window!
        window.styleMask.remove(NSWindow.StyleMask.unifiedTitleAndToolbar)
        window.styleMask.remove(NSWindow.StyleMask.fullSizeContentView)
        window.styleMask.remove(NSWindow.StyleMask.titled)
        window.toolbar?.isVisible = false
        window.titleVisibility = .hidden
        window.titlebarAppearsTransparent = false
    }
    
}
