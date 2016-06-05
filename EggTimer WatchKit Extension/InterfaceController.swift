//
//  InterfaceController.swift
//  EggTimer WatchKit Extension
//
//  Created by Saroj Rout on 3/28/15.
//  Copyright (c) 2015 Saroj Rout. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var countDown: WKInterfaceTimer!
    
    @IBOutlet weak var softButton: WKInterfaceButton!
    
    @IBOutlet weak var medButton: WKInterfaceButton!
    
    @IBOutlet weak var hardButton: WKInterfaceButton!
    
    @IBOutlet weak var resetBtn: WKInterfaceButton!
    
    var timer : NSTimer!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        resetBtn.setHidden(true)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func softBtnPressed() {
        NSLog("button soft pressed")
        startTimer(120)
    }
    @IBAction func medBtnPressed() {
         NSLog("button med pressed")
        startTimer(300)
    }
    @IBAction func hardBtnPressed() {
        startTimer(600)
    }
    @IBAction func resetBtnPressed() {
        timerHasStopped()
        countDown.stop()
        countDown.setHidden(true)
    }
    
    func startTimer(timerInSec : Float){
        countDown.setDate(NSDate(timeInterval: NSTimeInterval(timerInSec), sinceDate: NSDate() ))
        
        countDown.start()
        softButton.setHidden(true)
        medButton.setHidden(true)
        hardButton.setHidden(true)
        resetBtn.setHidden(false)
        
        // to display the buttons after the timer has stopped
        
        timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(timerInSec), target: self, selector: Selector("timerHasStopped"), userInfo: nil, repeats: false)
        
    }
    func timerHasStopped(){
        timer.invalidate()
        softButton.setHidden(false)
        medButton.setHidden(false)
        hardButton.setHidden(false)
        resetBtn.setHidden(true)
    }
    

}
