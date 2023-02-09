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
    
    @Published var savedMoods: [MoodEntry] = []
    @Published var changedMood: MoodEntry?
    
    init(){
        container.loadPersistentStores{ desc, error in
            if let error = error {
                print("Failed to load data Mood Entry \(error.localizedDescription)")
            }
        }
        fetchMoods()
    }
    
    func fetchMoods(){
        let request = NSFetchRequest<MoodEntry>(entityName: "MoodEntry")
        
        do{
            savedMoods = try container.viewContext.fetch(request)
        } catch let error{
            print("Error \(error)")
        }
        
    }
    
    func saveMood(context: NSManagedObjectContext){
        do{
            try context.save()
            fetchMoods()
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
        
        changedMood = moodEntry
        
        saveMood(context: context)
    }
    
    func editMood(moodEntry: MoodEntry, mood: String, water: Int16, diaryEntry: String, date: Date, context: NSManagedObjectContext){
        moodEntry.date = date
        moodEntry.mood = mood
        moodEntry.water = water
        moodEntry.diaryEntry = diaryEntry
        
        changedMood = moodEntry
        
        saveMood(context: context)
    }
}
