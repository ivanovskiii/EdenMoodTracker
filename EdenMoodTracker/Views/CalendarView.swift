//
//  CalendarView.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski on 6.2.23.
//

import SwiftUI
import CoreData

struct CalendarView: UIViewRepresentable {
    
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
    }
    
    
    class Coordinator: NSObject, UICalendarViewDelegate {
        
        
        
        var parent: CalendarView
        init(parent: CalendarView) {
            self.parent = parent
        }
        
        @MainActor
        func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
                        
            let image = UIImage(systemName: "smiley")?.withRenderingMode(.alwaysOriginal)
            return .image(image)

        }
    }
    
    
    
    
}


