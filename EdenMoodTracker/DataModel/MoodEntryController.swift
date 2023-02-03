//
//  MoodEntryController.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski on 2.2.23.
//

import Foundation
import CoreData

class MoodEntryController: ObservableObject{
    let container = NSPersistentContainer(name: "EdenMoodTracker")
    
    init(){
        container.loadPersistentStores{ desc, error in
            if let error = error {
                print("Failed to load data Mood Entry \(error.localizedDescription)")
            }
        }
    }
    
    func saveMood(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Mood Entry saved!")
        } catch{
            print("Could not save Mood Entry!")
        }
    }
    
    func addMood(mood: String, water: Int16, diaryEntry: String, date: Date, context: NSManagedObjectContext){
        let moodEntry = MoodEntry(context: context)
        moodEntry.id = UUID()
        moodEntry.date = Date()
        moodEntry.mood = mood
        moodEntry.water = water
        moodEntry.diaryEntry = diaryEntry
        
        saveMood(context: context)
    }
    
    func editMood(moodEntry: MoodEntry, mood: String, water: Int16, diaryEntry: String, date: Date, context: NSManagedObjectContext){
        moodEntry.date = Date()
        moodEntry.mood = mood
        moodEntry.water = water
        moodEntry.diaryEntry = diaryEntry
        
        saveMood(context: context)
    }
}
