//
//  ContentView.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski on 1.2.23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var showingAddView = false

    
    var body: some View {
        Button("Log Your Mood for Today"){
            showingAddView.toggle()
        }
        .sheet(isPresented: $showingAddView){
            AddMoodVIew()
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(Color(.white))
        .padding()
        .background(Color("edenIndigo"))
        .clipShape(Capsule())
    }
    
    struct ContentView_Previews: PreviewProvider{
        static var previews: some View{
            ContentView()
        }
    }
    
}
