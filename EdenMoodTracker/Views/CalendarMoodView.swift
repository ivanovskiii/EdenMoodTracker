//
//  CalendarMoodView.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski & Iva Naskovska on 6.2.23.//

import SwiftUI
import CoreData

struct CalendarMoodView: View {
    
    var body: some View {
        CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture))
                .padding(.top, 100)
    }
    
}

struct CalendarMoodView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarMoodView()
    }
}
