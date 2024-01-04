//
//  InfoView.swift
//  Bible Verse of the Day - NO ADS
//
//  Created by Michael Cheng on 1/2/24.
//

import SwiftUI

struct DevotionalView: View {
    @Binding var isPresented: Bool

    var devotional: String
    var prayer: String
    
    var dismissAction: () -> Void
    
    var body: some View {
        Text("Devotional")
            .font(.title)
            .padding(.horizontal)
            .padding(.top)
        
        Text(devotional)
            .padding(.horizontal)
            .padding(.top)
        
        Text("Prayer")
            .font(.title)
            .padding(.horizontal)
            .padding(.top)
        
        Text(prayer)
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
