//
//  Date+Extension.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski & Iva Naskovska on 10.2.23.
//

import Foundation

extension Date{
    var startOfDay: Date{
        Calendar.current.startOfDay(for: self)
    }
}
