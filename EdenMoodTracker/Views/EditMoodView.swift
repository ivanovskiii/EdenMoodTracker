import SwiftUI

struct EditMoodView: View {
    @Environment (\.managedObjectContext) var ManagedObjectContext
    @Environment(\.dismiss) var dismiss
    
    var moodEntry: FetchedResults<MoodEntry>.Element
    
    @State private var mood = ""
    @State private var diaryEntry = ""
    @State private var waterValue: Int16 = 0
    @State private var selectedIdx = 0
    
    @State private var options = ["Terrible", "Bad", "Meh", "Good", "Amazing"]
    
    var body: some View {
        
        VStack {
            
            Form{

                Section() {
                    let date = moodEntry.date!.formatted(date: .complete, time: .omitted)
                    Text("Update Mood Log for \(date)")
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
                    }.pickerStyle(SegmentedPickerStyle())
                }.onAppear(){
                    let moodExisting = moodEntry.mood!
                    if(moodExisting==options[0]){
                        selectedIdx=0
                    }
                    else if(moodExisting==options[1]){
                        selectedIdx=1
                    }
                    else if(moodExisting==options[2]){
                        selectedIdx=2
                    }
                    else if(moodExisting==options[3]){
                        selectedIdx=3
                    }
                    else if(moodExisting==options[4]){
                        selectedIdx=4
                    }
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
                }.onAppear(){
                    var waterExisting = moodEntry.water
                    waterValue = waterExisting
                }
                Section(){
                    Text("Diary")
                        .fontWeight(.bold)
                        .foregroundColor(Color("edenPlum"))
                        .frame(maxWidth: .infinity)
                    TextEditor(text: $diaryEntry)
                        .frame(minHeight: 200, maxHeight: 200)
                }.onAppear(){
                    let textExisting = moodEntry.diaryEntry!
                    diaryEntry = textExisting
                }
                HStack{
                    Button("Update Mood"){
                        MoodEntryController().editMood(moodEntry: moodEntry, mood: options[selectedIdx], water: waterValue, diaryEntry: diaryEntry, date: moodEntry.date!, context: ManagedObjectContext)
                        let impactMed = UIImpactFeedbackGenerator(style: .light)
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
