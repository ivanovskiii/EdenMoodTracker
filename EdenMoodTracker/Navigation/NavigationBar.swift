//
//  NavigationBar.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski on 1.2.23.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            Image("edenLogo")
                .resizable()
                .frame(width: 115, height: 85)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 25)
        }
            .frame(height: 100)
            .frame(maxHeight: .infinity, alignment: .top)
    }
    
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
