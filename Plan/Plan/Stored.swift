//
//  Stored.swift
//  RunningPlan
//
//  Created by 李正宁 on 6/30/15.
//  Copyright (c) 2015 Zhengning Li. All rights reserved.
//

import Foundation
import CoreData

class Stored : NSManagedObject{
    
    var seconds: String?
    var minutes: String?
    var hours: String?
    var date: NSDate?
    
    init(seconds: String, minutes: String, hours: String) {
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
        self.date = NSDate()
    }
    
   
    
}