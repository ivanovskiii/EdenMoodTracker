//
//  NavigationBar.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski & Iva Naskovska on 6.2.23.
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
                .scaledToFit()
                .frame(width: 100)
                .frame(maxWidth: .infinity, alignment: .top)
                .padding(.leading, 10)
        }
            .frame(height: 80)
            .frame(maxHeight: .infinity, alignment: .top)
    }
    
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
