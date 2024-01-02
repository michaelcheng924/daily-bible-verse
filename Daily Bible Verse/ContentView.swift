//
//  ContentView.swift
//  Daily Bible Verse
//
//  Created by Michael Cheng on 1/1/24.
//

import SwiftUI

struct ContentView: View {
    var bibleVerses = ["BV 1", "BV 2"]

    var body: some View {
        TabView(selection:.constant(0)) {
            ForEach(0..<bibleVerses.count) { index in
                ZStack {
                    Image("bgImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                    Text(bibleVerses[index])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding(.top, -100)
                        .padding(.horizontal, 20)
                        .frame(width: 300, alignment: .leading)
                        .multilineTextAlignment(.center)
                }
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
