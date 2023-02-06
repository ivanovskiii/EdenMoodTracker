//
//  AddMoodVIew.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski on 2.2.23.
//

import SwiftUI

struct AddMoodVIew: View {
    @Environment (\.managedObjectContext) var ManagedObjectContext
    @Environment(\.dismiss) var dismiss
    
    @State private var mood = ""
    @State private var diaryEntry = ""
    @State private var waterValue: Int16 = 0
    
    @State private var selectedIdx = 2
    @State private var options = ["Terrible", "Bad", "Meh", "Good", "Amazing"]
    @State private var date = Date.now.formatted(date: .complete, time: .omitted)
    
    @Namespace private var animation
    @State private var isFlipped = false
    
    var body: some View {
        
        VStack {
            
            Form{
                
                Section() {
                    Text("Mood Log for \(date)")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color("edenPlum"))
                }
                Section(){
                    if(selectedIdx==0){
                        VStack {
                            Image("terrible")
                            Text("Terrible")
                                .foregroundColor(Color("edenBlue"))
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    else if(selectedIdx==1){
                        VStack{
                            Image("bad")
                            Text("Bad")
                                .foregroundColor(Color("edenBabyBlue"))
                                .fontWeight(.bold)
                        }.frame(maxWidth: .infinity)
                        
                    }
                    else if(selectedIdx==2){
                        VStack{
                            Image("meh")
                            Text("Meh")
                                .foregroundColor(Color("edenDarkMint"))
                                .fontWeight(.bold)
                        }.frame(maxWidth: .infinity)
                    }
                    else if(selectedIdx==3){
                        VStack{
                            Image("good")
                            Text("Good")
                                .foregroundColor(Color("edenPeach"))
                                .fontWeight(.bold)
                        }.frame(maxWidth: .infinity)
                        
                    }
                    else if(selectedIdx==4){
                        VStack{
                            Image("amazing")
                            Text("Amazing")
                                .foregroundColor(Color("edenOrange"))
                                .fontWeight(.bold)
                        }.frame(maxWidth: .infinity)
                    }
                    Picker(selection: $selectedIdx, label: Text("Mood Picker")) {
                        ForEach(0 ..< 5) {
                            Text(self.options[$0])
                                .foregroundColor(Color("edenPlum"))
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    Stepper("Water: \(waterValue)", value: $waterValue, in: 0...50)

                        .padding(15)
                        .foregroundColor(Color("edenPlum"))
                        .overlay{
                                if(waterValue==0){
                                    Image("glass_empty")
                                }
                                else if(waterValue>0 && waterValue<=2){
                                    Image("glass_one_third")
                                }
                                else if(waterValue>2 && waterValue<=4){
                                    Image("glass_half")
                                }
                                else if(waterValue>4 && waterValue<=6){
                                    Image("glass_almost_full")
                                }
                                else if(waterValue>6){
                                    Image("glass_full")
                                }
                        }
                }
                Section(){
                    Text("Diary")
                        .fontWeight(.bold)
                        .foregroundColor(Color("edenPlum"))
                        .frame(maxWidth: .infinity)
                    TextEditor(text: $diaryEntry)
                        .frame(minHeight: 200, maxHeight: 200)
                }
                HStack{
                    Button("Log Mood"){
                        MoodEntryController().addMood(mood: options[selectedIdx], water: waterValue, diaryEntry: diaryEntry, date: Date.now, context: ManagedObjectContext)
                        let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                            impactMed.impactOccurred()
                        dismiss()
                    }
                }.frame(maxWidth: .infinity)
                .foregroundColor(Color(.white))
                .padding()
                .background(Color("edenIndigo"))
                .clipShape(Capsule())
            }
            
        }
        
    }
    
}

struct AddMoodVIew_Previews: PreviewProvider {
    static var previews: some View {
        AddMoodVIew()
    }
}
