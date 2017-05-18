//
//  ViewController.swift
//  GPAcalculator
//
//  Created by Wes Bosman on 2/2/17.
//  Copyright © 2017 Wes Bosman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Array of courses
    var courseArray: [Course] = []
    // Labels
    @IBOutlet weak var gpaCalculatorTitleLabel: UILabel!
    @IBOutlet weak var chalkboardCurrentCoursesLabel: UILabel!
    @IBOutlet weak var chalkboardGPALabel: UILabel!
    @IBOutlet weak var assessmentLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var assignmentLabel: UILabel!
    @IBOutlet weak var midtermLabel: UILabel!
    @IBOutlet weak var finalLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var creditsLabel: UILabel!
    @IBOutlet weak var chalkboardLabelOne: UILabel!
    @IBOutlet weak var chalkboardLabelTwo: UILabel!
    @IBOutlet weak var chalkboardLabelThree: UILabel!
    @IBOutlet weak var chalkboardLabelFour: UILabel!
    // Buttons
    @IBOutlet weak var addCourseButton: UIButton!
    @IBOutlet weak var removeCourseButton: UIButton!
    // Images
    @IBOutlet weak var chalkboardImageOne: UIImageView!
    @IBOutlet weak var chalkboardImageTwo: UIImageView!
    @IBOutlet weak var chalkboardImageThree: UIImageView!
    @IBOutlet weak var chalkboardImageFour: UIImageView!
    // Text Fields
    @IBOutlet weak var assignmentPointsTextField: UITextField!
    @IBOutlet weak var assignmentMaxTextField: UITextField!
    @IBOutlet weak var assignmentPercentTextField: UITextField!
    @IBOutlet weak var midtermPointsTextField: UITextField!
    @IBOutlet weak var midtermMaxTextField: UITextField!
    @IBOutlet weak var midtermPercentTextField: UITextField!
    @IBOutlet weak var finalPointsTextField: UITextField!
    @IBOutlet weak var finalMaxTextField: UITextField!
    @IBOutlet weak var finalPercentTextField: UITextField!
    @IBOutlet weak var creditsTextField: UITextField!
    @IBOutlet weak var courseNameTextField: UITextField!
    @IBOutlet weak var removeCourseTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    
    let dismiss: UIAlertAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Round the corners of the labels
        gpaCalculatorTitleLabel.layer.cornerRadius = 5
        assessmentLabel.layer.cornerRadius = 5
        pointsLabel.layer.cornerRadius  = 5
        maxLabel.layer.cornerRadius     = 5
        percentLabel.layer.cornerRadius = 5
        assignmentLabel.layer.cornerRadius = 5
        midtermLabel.layer.cornerRadius = 5
        finalLabel.layer.cornerRadius   = 5
        creditsLabel.layer.cornerRadius = 5
        courseNameLabel.layer.cornerRadius = 5
        backgroundView.layer.cornerRadius = 5
        
        // Hide the chalkboard labels
        chalkboardLabelOne.isHidden = true
        chalkboardLabelTwo.isHidden = true
        chalkboardLabelThree.isHidden = true
        chalkboardLabelFour.isHidden = true
        
        // Hide the chalkboard images
        chalkboardImageOne.isHidden = true
        chalkboardImageTwo.isHidden = true
        chalkboardImageThree.isHidden = true
        chalkboardImageFour.isHidden = true
        
        // Hide the remove couse button and text field
        removeCourseButton.isHidden = true
        removeCourseTextField.isHidden = true
        
        // Fill the textfields with default values
        assignmentPointsTextField.text = "79"
        assignmentMaxTextField.text = "100"
        assignmentPercentTextField.text = "20"
        
        midtermPointsTextField.text = "89"
        midtermMaxTextField.text = "100"
        midtermPercentTextField.text = "40"
        
        finalPointsTextField.text = "91"
        finalMaxTextField.text = "100"
        finalPercentTextField.text = "40"
        
        courseNameTextField.text = "Data Structures"
        creditsTextField.text = "4"
        
    }
    
    @IBAction func addCourseButtonPressed(_ sender: AnyObject) {
        print("Add Course Button Pressed")
        
        if let assignmentPoints = Double(assignmentPointsTextField.text!),
            let assignmentPercent = Double(assignmentPercentTextField.text!),
            let assignmentMax = Double(assignmentMaxTextField.text!),
            let midtermPoints = Double(midtermPointsTextField.text!),
            let midTermPercent = Double(midtermPercentTextField.text!),
            let midTermMax = Double(midtermMaxTextField.text!),
            let finalPoints = Double(finalPointsTextField.text!),
            let finalMax = Double(finalMaxTextField.text!),
            let finalPercent = Double(finalPercentTextField.text!),
            let courseName = courseNameTextField.text,
            let courseCredits = creditsTextField.text{
            print("Course will be added to the array and blackboard")
            
            // Create an alert dialog incase we run into errors
            let errorAlert = UIAlertController()
            let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            errorAlert.addAction(dismissAction)
            
            // If the assignment points, midterm points or final points are not between zero and max
            if(assignmentPoints < 0 || assignmentPoints > assignmentMax){
                print("Assignment points is not between 0 and \(assignmentMax)")
                let errorAlert = UIAlertController(title: "Error", message: "Assignment points are not between 0 and \(assignmentMax)", preferredStyle: .alert)
                errorAlert.addAction(dismiss)
                self.present(errorAlert, animated: true, completion: nil)
            }
            else if(midtermPoints < 0 || midtermPoints > midTermMax){
                print("Midterm points are not between 0 and \(midTermMax)")
                let errorAlert = UIAlertController(title: "Error", message: "Midterm points is not between 0 and \(midTermMax)", preferredStyle: .alert)
                errorAlert.addAction(dismiss)
                self.present(errorAlert, animated: true, completion: nil)
            }
            else if(finalPoints < 0 || finalPoints > finalMax){
                print("Final points are not between 0 and \(finalMax)")
                let errorAlert = UIAlertController(title: "Error", message: "Final points are not between 0 and \(finalMax)", preferredStyle: .alert)
                errorAlert.addAction(dismiss)
                self.present(errorAlert, animated: true, completion: nil)
            }
            else if(assignmentPercent + midTermPercent + finalPercent != 100){
                let errorAlert = UIAlertController(title: "Error", message: "The sum of the weights of the assignments, midterm and final do not add up to 100%. The current weights add up to \(assignmentPercent + midTermPercent + finalPercent)", preferredStyle: .alert)
                errorAlert.addAction(dismiss)
                self.present(errorAlert, animated: true, completion: nil)
            }
            else if courseArray.contains(where: {$0.courseName == courseName}){
                print("Course Array already contains a course named: \(courseName)")
                let errorAlert = UIAlertController(title: "Error", message: "There is already a course with the name \(courseName)", preferredStyle: .alert)
                errorAlert.addAction(dismiss)
                self.present(errorAlert, animated: true, completion: nil)
            }
            // Create a new course and add it to the array
            else{
                let assignmentAsmnt: Assessment = Assessment(points: assignmentPoints, max: assignmentMax, percent: assignmentPercent)
            
                print("Assignment Assessment Score \(assignmentAsmnt.assessmentScore)")
            
                let midTermAsmnt:Assessment = Assessment(points: midtermPoints, max: midTermMax, percent: midTermPercent)
                print("Midterm Assessment Score \(midTermAsmnt.assessmentScore)")
            
            
                let finalAsmnt: Assessment = Assessment(points: finalPoints, max: finalMax, percent: finalPercent)
                print("Final Assessment Score \(finalAsmnt.assessmentScore)")
            
                if let credits = Double(courseCredits){
                    // Calculate the total grade
                    let total = assignmentAsmnt.assessmentScore
                    + midTermAsmnt.assessmentScore
                    + finalAsmnt.assessmentScore
                
                    let course = Course(courseName: courseName,
                                        courseCredits: credits,
                                        assignmentScore: assignmentAsmnt.assessmentScore,
                                        midtermScore: midTermAsmnt.assessmentScore,
                                        finalScore:finalAsmnt.assessmentScore,
                                        numericGrade: total)
                    // Add course to array
                    addCourseToArray(course: course)
                
                    print("Total Weighted Score -> \(total)")
                    calculateGPA()
                }
                else{
                    print("Course Credits could not be converted to a double")
                }
            }
        }
        else{
            print("Unable to add course to the course array or the blackboard")
        }
        
    }
    
    @IBAction func removeCourseButtonPressed(_ sender: AnyObject) {
        print("Remove Course Button Pressed")
        // Get the value from the text field and extract the course name
        if let index = Int(removeCourseTextField.text!){
            // Check bounds
            let newIndx = index - 1
            print("New Index -> \(newIndx)")
            
            if(newIndx >= 0 && newIndx < courseArray.count){
                courseArray.remove(at: index - 1)
                calculateGPA()
                updateCourseLabels()
            }
            else{
                let alert = UIAlertController(title: "Error", message: "There is no course with an id of: \(index)", preferredStyle: .alert)
                alert.addAction(dismiss)
                self.present(alert, animated: true, completion: nil)
            }
        }
        else{
            print("A valid integer was not entered for the course id")
        }
    }
    
    func calculateGPA(){
        var totalCredits:Double = 0
        var sum:Double = 0
        
        for course in courseArray{
            if let numericGrade = course.numericGrade{
                let creditHours = gradeToCreditHours(courseGrade: numericGrade) * course.courseCredits
                totalCredits = totalCredits + course.courseCredits
                sum = sum + creditHours
            }
            else{
                print("No numeric grade for course \(course.courseName)")
            }
        }
        
        // Calculate GPA and update the gpa text
        let gpa = sum / totalCredits
        updateGPA(gpa: gpa)
    }
    
    // Convert a numeric grade to a number of credits
    func gradeToCreditHours(courseGrade: Double) -> Double{
        if(courseGrade <= 100 && courseGrade >= 90){
            return 4.0
        }
        else if(courseGrade < 90 && courseGrade >= 80){
            return 3.0
        }
        else if(courseGrade < 80 && courseGrade >= 70){
            return 2.0
        }
        else if(courseGrade < 70 && courseGrade >= 60){
            return 1.0
        }
        else{
            return 0.0
        }
    }
    
    // Update GPA
    func updateGPA(gpa: Double){
        let gpaStr = String(format: "%.2f", gpa)
        let gpaString = "GPA: \(gpaStr)"
        chalkboardGPALabel.text = gpaString

        if(gpa >= 3.0 && gpa <= 4.0){
            chalkboardGPALabel.textColor = UIColor.green
        }
        else if(gpa < 3.0 && gpa >= 2.0){
            chalkboardGPALabel.textColor = UIColor.orange
        }
        else if(gpa < 2.0){
            chalkboardGPALabel.textColor = UIColor.red
        }
    }
    

    // If there are 4 courses
    var fourCourses:Bool {
        return courseArray.count == 4 ? true : false
    }
    
    // There are less than four courses
    var lessThanFourCourses: Bool {
        return courseArray.count < 4 ? true : false
    }
    
    // Add a course to the array of courses to display
    func addCourseToArray(course: Course){
        // There are already four courses do not add a new one
        if(fourCourses){
            let alert: UIAlertController = UIAlertController(title: "Courses", message: "There are already four courese please delete a course before adding a new one", preferredStyle: .alert)
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        }
        else if(lessThanFourCourses){
            // There are less than four courses so add a course
            courseArray.append(course)
        }
        updateCourseLabels()
    }
    
    // Update, set and unhide the correct labels and images
    func updateCourseLabels(){
        let numberOfCourses = courseArray.count
        switch(numberOfCourses){
        case 0:
            print("Case 0")
            // Hide the chalkboard labels
            chalkboardLabelOne.isHidden = true
            chalkboardLabelTwo.isHidden = true
            chalkboardLabelThree.isHidden = true
            chalkboardLabelFour.isHidden = true

            // Hide the chalkboard images
            chalkboardImageOne.isHidden = true
            chalkboardImageTwo.isHidden = true
            chalkboardImageThree.isHidden = true
            chalkboardImageFour.isHidden = true
            
            // Hise the remove course buttons
            removeCourseButton.isHidden = true
            removeCourseTextField.isHidden = true
            
            chalkboardGPALabel.text = "GPA: "
            chalkboardGPALabel.textColor = UIColor.white
            
        case 1:
            print("Case 1")
            let courseOne = courseArray[0]
            setLabelAndImage(i: 1, course: courseOne)
            
            // Unhide the first label and image
            toggleLabelAndImage(i: 1, bool: false)
            toggleLabelAndImage(i: 2, bool: true)
            toggleLabelAndImage(i: 3, bool: true)
            toggleLabelAndImage(i: 4, bool: true)
            
            // Unhide remove buttons
            removeCourseButton.isHidden = false
            removeCourseTextField.isHidden = false
            
        case 2:
            print("Case 2")
            let courseOne = courseArray[0]
            let courseTwo = courseArray[1]
            
            // Set the images and labels
            setLabelAndImage(i: 1, course: courseOne)
            setLabelAndImage(i: 2, course: courseTwo)
            
            // Unhide labels and images
            toggleLabelAndImage(i: 1, bool: false)
            toggleLabelAndImage(i: 2, bool: false)
            toggleLabelAndImage(i: 3, bool: true)
            toggleLabelAndImage(i: 4, bool: true)
            
        case 3:
            print("Case 3")
            let courseOne = courseArray[0]
            let courseTwo = courseArray[1]
            let courseThree = courseArray[2]
            
            // Set Labels and images
            setLabelAndImage(i: 1, course: courseOne)
            setLabelAndImage(i: 2, course: courseTwo)
            setLabelAndImage(i: 3, course: courseThree)
            // Unhide them
            toggleLabelAndImage(i: 1, bool: false)
            toggleLabelAndImage(i: 2, bool: false)
            toggleLabelAndImage(i: 3, bool: false)
            toggleLabelAndImage(i: 4, bool: true)
        
        case 4:
            print("Case 4")
            let courseOne = courseArray[0]
            let courseTwo = courseArray[1]
            let courseThree = courseArray[2]
            let courseFour  = courseArray[3]
            // Set labels and images
            setLabelAndImage(i: 1, course: courseOne)
            setLabelAndImage(i: 2, course: courseTwo)
            setLabelAndImage(i: 3, course: courseThree)
            setLabelAndImage(i: 4, course: courseFour)
            // unhide them
            toggleLabelAndImage(i: 1, bool: false)
            toggleLabelAndImage(i: 2, bool: false)
            toggleLabelAndImage(i: 3, bool: false)
            toggleLabelAndImage(i: 4, bool: false)

        default:
            print("Default course case entered")
        }
    }
    
    // Set the label and image for a course
    func setLabelAndImage(i: Int, course: Course){
        let courseString = " \(course.courseName) | \(course.courseCredits)"
        switch(i){
        case 1:
            chalkboardLabelOne.text  = "1) \(courseString)"
            chalkboardImageOne.image = getGradeImage(course: course)
        case 2:
            chalkboardLabelTwo.text  = "2) \(courseString)"
            chalkboardImageTwo.image = getGradeImage(course: course)
        case 3:
            chalkboardLabelThree.text  = "3) \(courseString)"
            chalkboardImageThree.image = getGradeImage(course: course)
        case 4:
            chalkboardLabelFour.text  = "4) \(courseString)"
            chalkboardImageFour.image = getGradeImage(course: course)
        default:
            break
        }
    }
    
    // Toggle the label and image on the chalkboard
    func toggleLabelAndImage(i: Int, bool: Bool){
        switch(i){
        case 1:
            chalkboardLabelOne.isHidden = bool
            chalkboardImageOne.isHidden = bool
        case 2:
            chalkboardLabelTwo.isHidden = bool
            chalkboardImageTwo.isHidden = bool
        case 3:
            chalkboardLabelThree.isHidden = bool
            chalkboardImageThree.isHidden = bool
        case 4:
            chalkboardLabelFour.isHidden = bool
            chalkboardImageFour.isHidden = bool
        default:
            break
        }
    }
    
    // Return the grade image for a course
    func getGradeImage(course: Course) -> UIImage{
        if let grade = course.numericGrade{
        
            if (grade >= 90 && grade <= 100){
                return UIImage(named: "grade_a")!
            }
            else if (grade >= 80 && grade < 90){
                return UIImage(named: "grade_b")!
            }
            else if (grade >= 70 && grade < 80){
                return UIImage(named: "grade_c")!
            }
            else if (grade >= 60 && grade < 70){
                return UIImage(named: "grade_d")!
            }
            else{
                return UIImage(named: "grade_f")!
            }
        }
        return UIImage()
    }
}

