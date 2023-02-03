//
//  TimelineView.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski on 1.2.23.
//

import SwiftUI
import CoreData

struct TimelineView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var mood: FetchedResults<MoodEntry>
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                List{
                    ForEach(mood) { mood in
                        NavigationLink(destination: Text("\(mood.mood ?? "Mood")")) {
                            HStack{
                                VStack(alignment: .leading, spacing: 6){
                                    Text(mood.mood!)
                                    
                                }
                            }
                        }
                    }.onDelete(perform: deleteMood)
                }
            }.toolbar{
                ToolbarItem(placement: .bottomBar){
                        Button{
                            showingAddView.toggle()
                        } label: {
                            Label("Log Mood", systemImage: "plus.circle")
                        }
                    }
                }
                .sheet(isPresented: $showingAddView){
                    AddMoodVIew()
                }
        }
        
    }
    
    private func deleteMood(offsets: IndexSet){
        withAnimation{
            offsets.map { mood[$0] }.forEach(managedObjectContext.delete)
            
            MoodEntryController().saveMood(context: managedObjectContext)
        }
    }
    
}



struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
