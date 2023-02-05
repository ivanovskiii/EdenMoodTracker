//
//  ContentView.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski on 1.2.23.
//

import SwiftUI
import CoreData
import RiveRuntime

struct ContentView: View {
    
    @State private var showingAddView = false
    
    var body: some View {
        
        
        ZStack {
            RiveViewModel(fileName: "shapes_new").view()
                .ignoresSafeArea()
                .blur(radius: 25)
                .aspectRatio(contentMode: .fill)
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
            ZStack{
                
                Text("\"Whatever we expect with confidence becomes our own self-fulfilling prophecy.\"")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 350, maxHeight: 120)
                    .fontWeight(.bold)
                    .foregroundColor(Color("edenLavender"))
                    .background(
                        Color.white
                            .blur(radius: 35)
                    )

            }.padding(.top, 500)
        }
    }
    
    struct ContentView_Previews: PreviewProvider{
        static var previews: some View{
            ContentView()
        }
    }
    
}
