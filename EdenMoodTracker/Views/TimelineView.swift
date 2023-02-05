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

    let dateFormatter = DateFormatter()
    
    @State private var date = Date.now.formatted(date: .complete, time: .omitted)
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                List{
                    Text("Test")
                    ForEach(mood) { mood in
                        NavigationLink(destination: EditMoodView(moodEntry: mood)) {
                            if(mood.mood=="Terrible"){
                                Image("terrible")
                                    .resizable()
                                    .frame(maxWidth: 70, maxHeight: 70)
                                Text(mood.mood!)
                                    .fontWeight(.black)
                                    .font(.system(size: 24))
                                    .foregroundColor(Color("edenBlue"))
                                let date = mood.date!.formatted(date: .abbreviated, time: .omitted)
                                Text(date)
                            }
                            if(mood.mood=="Bad"){
                                Image("bad")
                                    .resizable()
                                    .frame(maxWidth: 70, maxHeight: 70)
                                Text(mood.mood!)
                                    .fontWeight(.black)
                                    .font(.system(size: 24))
                                    .foregroundColor(Color("edenBabyBlue"))
                                let date = mood.date!.formatted(date: .abbreviated, time: .omitted)
                                Text(date)

                            }
                            if(mood.mood=="Meh"){
                                Image("meh")
                                    .resizable()
                                    .frame(maxWidth: 70, maxHeight: 70)
                                Text(mood.mood!)
                                    .fontWeight(.black)
                                    .font(.system(size: 24))
                                    .foregroundColor(Color("edenDarkMint"))
                                let date = mood.date!.formatted(date: .abbreviated, time: .omitted)
                                Text(date)

                            }
                            if(mood.mood=="Good"){
                                Image("good")
                                    .resizable()
                                    .frame(maxWidth: 70, maxHeight: 70)
                                Text(mood.mood!)
                                    .fontWeight(.black)
                                    .font(.system(size: 24))
                                    .foregroundColor(Color("edenPeach"))
                                let date = mood.date!.formatted(date: .abbreviated, time: .omitted)
                                Text(date)

                            }
                            if(mood.mood=="Amazing"){
                                Image("amazing")
                                    .resizable()
                                    .frame(maxWidth: 70, maxHeight: 70)
                                Text(mood.mood!)
                                    .fontWeight(.black)
                                    .font(.system(size: 24))
                                    .foregroundColor(Color("edenOrange"))
                                let date = mood.date!.formatted(date: .abbreviated, time: .omitted)
                                Text(date)

                            }
                        }
                    }
                    .onDelete(perform: deleteMood)
                }.padding(.top, 70)
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
