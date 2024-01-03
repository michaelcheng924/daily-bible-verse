//
//  InfoView.swift
//  Bible Verse of the Day - NO ADS
//
//  Created by Michael Cheng on 1/2/24.
//

import SwiftUI

struct InfoView: View {
    @Binding var isPresented: Bool
    var dismissAction: () -> Void
    
    var body: some View {
        Text("About This App")
            .font(.title)
            .padding(.horizontal)
            .padding(.top)
        Text("Hello! My name is Mike. I'm a Christian, husband, father, and deacon at my church. Would you consider joining me in my mission to build free Christian apps?")
            .padding(.horizontal)
            .padding(.top)
        
        VStack(alignment: .leading) {
            Link(destination: URL(string: "https://www.patreon.com/JoyfulExile")!) {
                Text("Patreon")
            }
            Text("Join my Patreon community to help me in my mission to build apps and create resources for Christians!")
        }
        .padding(.horizontal)
        .padding(.top)
        
        Button(action: {
            dismissAction()
        }) {
            Text("Close")
                .font(.headline)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding(.horizontal)
        .padding(.top)
    }
}
