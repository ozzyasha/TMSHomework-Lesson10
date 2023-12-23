//
//  CustomClass.swift
//  TMSHomework-Lesson10
//
//  Created by Наталья Мазур on 23.12.23.
//

import Foundation

class CustomClass {
    var stringProperty: String?
    var intProperty: Int?
    var doubleProperty: Double?
    
    init(stringProperty: String? = nil, intProperty: Int? = nil, doubleProperty: Double? = nil) {
        self.stringProperty = stringProperty
        self.intProperty = intProperty
        self.doubleProperty = doubleProperty
    }
    
}
