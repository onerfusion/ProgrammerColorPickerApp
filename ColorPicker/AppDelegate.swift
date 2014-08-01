//
//  AppDelegate.swift
//  ColorPicker
//
//  Created by Martyn Chamberlin on 7/24/14.
//  Copyright (c) 2014 Martyn Chamberlin. All rights reserved.
//

import Cocoa


class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet var window: NSWindow!
    @IBOutlet var picker: NSColorWell!
    @IBOutlet var hex: NSTextField!
    @IBOutlet var rTextField: NSTextField!
    @IBOutlet var gTextField: NSTextField!
    @IBOutlet var bTextField: NSTextField!
    
    @IBOutlet var objectivecScrollView: NSTextField!
    
    @IBOutlet var swiftScrollView: NSTextField!

    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
        
        picker.color = NSColor.whiteColor()
        window.backgroundColor = NSColor.whiteColor()
        
        //picker.performClick(nil)
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }
    
    // This function fires when the user changes the selected
    // color
    @IBAction func selector(AnyObject) {
        // color is an array with 3 elements, for the RGB
        let color = CGColorGetComponents(picker.color.CGColor )
        
        let r = Int( round( color[0] * 255 ) );
        let g = Int( round(color[1] * 255 ) );
        let b =  Int( round( color[2] * 255 ) );
        
        let hexVal = String(format:"%2X", r) + String(format:"%2X", g) + String(format:"%2X", b)

        hex.stringValue = hexVal
        
        rTextField.stringValue = String(r)
        gTextField.stringValue = String(g)
        bTextField.stringValue = String(b)
        
        objectivecScrollView.stringValue = "UIColor * color = [UIColor colorWithRed:" + String(r) + "/255.0 green:" + String(g) + "/255.0 blue:" + String(b) + "/255.0 alpha:1];";
        
        swiftScrollView.stringValue = "let color = UIColor(red:" + String(r) + "/255.0, green:" + String(r) + "/255.0, blue:" + String(r) + "/255.0, alpha: 1.0)"
    }
}

