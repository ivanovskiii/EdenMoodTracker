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
                            if(mood.mood=="Terrible"){
                                Image("terrible")
                                    .resizable()
                                    .frame(maxWidth: 70, maxHeight: 70)
                                Text(mood.mood!)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("edenBlue"))
                            }
                            if(mood.mood=="Bad"){
                                Image("bad")
                                    .resizable()
                                    .frame(maxWidth: 70, maxHeight: 70)
                                Text(mood.mood!)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("edenBabyBlue"))

                            }
                            if(mood.mood=="Meh"){
                                Image("meh")
                                    .resizable()
                                    .frame(maxWidth: 70, maxHeight: 70)
                                Text(mood.mood!)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("edenDarkMint"))

                            }
                            if(mood.mood=="Good"){
                                Image("good")
                                    .resizable()
                                    .frame(maxWidth: 70, maxHeight: 70)
                                Text(mood.mood!)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("edenPeach"))

                            }
                            if(mood.mood=="Amazing"){
                                Image("amazing")
                                    .resizable()
                                    .frame(maxWidth: 70, maxHeight: 70)
                                Text(mood.mood!)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("edenOrange"))

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
