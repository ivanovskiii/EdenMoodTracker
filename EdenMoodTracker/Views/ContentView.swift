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
        
        ZStack {
            ZStack{
                Circle()
                    .foregroundColor(Color.clear)
                    .frame(width: 350)
                    .background(
                            .ultraThinMaterial,
                            in: Circle())
                VStack(){
                    Text("Today")
                        .fontWeight(.light)
                        .font(.system(size: 24))
                        .foregroundColor(Color("edenIndigo"))
                    
                    Text(Date.now.formatted(.dateTime.weekday(.wide)))
                        .foregroundColor(Color("edenIndigo"))
                        .fontWeight(.bold)
                        .font(.system(size: 36))
                    
                    Text(Date.now.formatted(.dateTime.day().month().year()))
                        .foregroundColor(Color("edenIndigo"))
                        .fontWeight(.black)
                        .font(.system(size: 40))
                    
                    Button("Log Your Mood for Today"){
                        showingAddView.toggle()
                    }
                    .frame(maxWidth: 200)
                    .foregroundColor(Color(.white))
                    .padding()
                    .background(Color("edenIndigo"))
                    .clipShape(Capsule())
                    .sheet(isPresented: $showingAddView){
                        AddMoodVIew()
                    }
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider{
        static var previews: some View{
            ContentView()
        }
    }
    
}
