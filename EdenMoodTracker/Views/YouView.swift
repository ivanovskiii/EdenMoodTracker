//
//  YouView.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski on 1.2.23.
//

import SwiftUI

struct YouView: View {
    var body: some View {
        ScrollView{
            Text("Hello, You!")
            Text("Hello, You!")
            Text("Hello, You!")
            Text("Hello, You!")
            Text("Hello, You!")
            Text("Hello, You!")
            Text("Hello, You!")
            Text("Hello, You!")
            Color.indigo
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(30)
    }
}

struct YouView_Previews: PreviewProvider {
    static var previews: some View {
        YouView()
    }
}
