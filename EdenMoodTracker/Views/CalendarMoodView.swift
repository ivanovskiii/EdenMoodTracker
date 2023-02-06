//
//  CalendarMoodView.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski on 6.2.23.
//

import SwiftUI
import CoreData

struct CalendarMoodView: View {
        
//    @Environment(\.managedObjectContext) var managedObjectContext
//    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)], predicate: NSPredicate(format: "mood == %@", moodFixed)) var moodEntry: FetchedResults<MoodEntry>
//
//    @FetchRequest var fetchRequest: FetchedResults<MoodEntry>
//
//    init(filter: String){
//        _fetchRequest = FetchRequest<MoodEntry>(sortDescriptors: [SortDescriptor(\.date, order: .reverse)], predicate: NSPredicate(format: "mood == %@", filter))
//    }
    
    @EnvironmentObject var moodEntry: MoodEntry
    
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
