//
//  Course.swift
//  GPAcalculator
//
//  Created by Wes Bosman on 2/7/17.
//  Copyright © 2017 Wes Bosman. All rights reserved.
//

import Foundation

// Creating a stucture that holds all course information
struct Course{
    var courseName:      String
    var courseCredits:   Double
    var assignmentScore: Double
    var midtermScore:    Double
    var finalScore:      Double
    var numericGrade:    Double?
}
