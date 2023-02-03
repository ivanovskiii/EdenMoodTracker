//
//  EdenMoodTrackerApp.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski on 1.2.23.
//

import SwiftUI

@main
struct EdenMoodTrackerApp: App {
    
    @StateObject private var moodEntryController = MoodEntryController()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, moodEntryController.container.viewContext)
        }
    }
}
