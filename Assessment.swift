//
//  Assessment.swift
//  GPAcalculator
//
//  Created by Wes Bosman on 2/12/17.
//  Copyright © 2017 Wes Bosman. All rights reserved.
//

import Foundation

class Assessment{
    var assessmentScore: Double
    
    init(points:Double, max: Double, percent: Double){
        assessmentScore = (points * (percent / 100))
    }
}
