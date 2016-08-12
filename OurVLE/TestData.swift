//
//  TestData.swift
//  OurVLE
//
//  Created by Javon Davis on 11/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation

func getTestCourses() -> [Course]
{
    var courses = [Course]()
    
    let course = Course()
    course.shortname = "MATH1141"
    course.id = 1
    course.fullname = "Introduction to Linear Algebra"
    course.summary = "Course will introduce you to the fundamentals of linear algebra"
    
    let course1 = Course()
    course.shortname = "MATH1142"
    course.id = 2
    course.fullname = "Calculus I"
    course.summary = "Course will introduce you to the fundamentals of Calculus I"
    
    let course2 = Course()
    course.shortname = "MATH1151"
    course.id = 3
    course.fullname = "Formal Mathematics"
    course.summary = "Course will introduce you to the fundamentals of Formal Mathematics"
    
    let course3 = Course()
    course.shortname = "MATH1152"
    course.id = 4
    course.fullname = "Calculus II"
    course.summary = "Course will introduce you to the fundamentals of Calculus II"
    
    let course4 = Course()
    course.shortname = "COMP1161"
    course.id = 5
    course.fullname = "Introduction to object Oriented Programming"
    course.summary = "Course will introduce you to the fundamentals of Object oriented Programming"
    
    courses.append(course)
    courses.append(course1)
    courses.append(course2)
    courses.append(course3)
    courses.append(course4)
    
    return courses
}
