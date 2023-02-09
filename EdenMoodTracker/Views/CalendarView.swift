
//
//  CalendarView.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski on 6.2.23.
//

import SwiftUI
import CoreData

struct CalendarView: UIViewRepresentable {
    
    @StateObject var moodEntryController = MoodEntryController()
    
    let interval: DateInterval
            
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.delegate = context.coordinator
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        return view
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
//        if let changedMood = moodEntryController.changedMood{
//            uiView.reloadDecorations(forDateComponents: [changedMood.date], animated: true)
//            moodEntryController.changedMood = nil
//        }
    }
    
    
    class Coordinator: NSObject, UICalendarViewDelegate {
        
        @Published var moodEntryController = MoodEntryController()
        
        var parent: CalendarView
        init(parent: CalendarView) {
            self.parent = parent
        }
        
        @MainActor
        func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
            
//            var foundMoods: [MoodEntry] = []
            
            let foundMoods = moodEntryController.savedMoods
                .filter{ $0.date?.startOfDay == dateComponents.date?.startOfDay }
            
//            for mood in moodEntryController.savedMoods {
//                if(mood.date == dateComponents.date){
//                    foundMoods = mood
//                }
//            }
            
            if foundMoods.isEmpty {
                return nil
            }
            
            return .image(UIImage(systemName: "smiley")?.withRenderingMode(.alwaysOriginal))
            
        }
    }
    
    
    
    
}


