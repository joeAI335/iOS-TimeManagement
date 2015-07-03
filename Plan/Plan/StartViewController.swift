//
//  StartViewController.swift
//  
//
//  Created by 李正宁 on 7/2/15.
//
//

import UIKit
import Foundation

class StartViewController: UIViewController {

    var history = [Stored]()
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var onceTime : Stored?
    
    @IBAction func showHistory(sender: UIBarButtonItem) {
        let storyboard = self.storyboard
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("History") as! HistoryTableViewController
        controller.history = self.history
        println(controller.history)
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    
    var startTime = NSTimeInterval()
    var timer = NSTimer()
    var hours: UInt8?
    var minutes: UInt8?
    var seconds: UInt8?

    @IBAction func StartAndStop(sender: UIButton) {
        if sender.titleLabel!.text == "Start" {
            sender.setTitle("Stop", forState: .Normal)
            if !timer.valid {
                let selector: Selector = "updateTime"
                timer.tolerance = 0.15
                timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: selector, userInfo: nil, repeats: true)
                startTime = NSDate.timeIntervalSinceReferenceDate()
                
            }
        } else {
            history.append(onceTime!)
            sender.setTitle("Start", forState: .Normal)
            timer.invalidate()
    }
    }
    
    
   
        
    func updateTime(){
        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        var elapsedTIme : NSTimeInterval = currentTime - startTime
        hours = UInt8(elapsedTIme / 3600)
        elapsedTIme -= (NSTimeInterval(hours!) * 3600)
        minutes = UInt8(elapsedTIme / 60.0)
        elapsedTIme -= (NSTimeInterval(minutes!) * 60)
        seconds = UInt8(elapsedTIme)
        elapsedTIme -= NSTimeInterval(seconds!)
        var strMinutes = String(format: "%02d", minutes!)
        var strSeconds = String(format: "%02d", seconds!)
        var strHours = String(format: "%02d", hours!)
        var once = Stored(seconds: strSeconds, minutes: strMinutes, hours: strHours)
        onceTime = once
        displayLabel.text = "\(strHours):\(strMinutes):\(strSeconds)"
            //        history.removeAll(keepCapacity: true)
            //        history.append(onceTime)
            //        return onceTime
    }

}
