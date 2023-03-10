//
//  MainView.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski & Iva Naskovska on 6.2.23.
//

import SwiftUI

struct MainView: View {
    
    let notificationHandler = NotificationHandler()
    
    init (){
        notificationHandler.requestAuth()
    }
    
    var body: some View {
            TabView{
                ContentView()
                    .tabItem {
                        Label("Home", systemImage: "smiley")
                    }
                TimelineView()
                    .tabItem{
                        Label("Timeline", systemImage: "chart.xyaxis.line")
                    }
                CalendarMoodView()
                    .tabItem{
                        Label("Calendar", systemImage: "calendar")
                    }
            }
            .overlay(){
                ZStack{
                    NavigationBar()
                }

            }
            .tint(Color("edenIndigo"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
