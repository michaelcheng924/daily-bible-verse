//
//  ContentView.swift
//  Daily Bible Verse
//
//  Created by Michael Cheng on 1/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var verseIndex = 0
    private let verses = Verse.verses
    
    

    var body: some View {
        TabView(selection: $verseIndex) {
            ForEach(verses) { verse in
                VerseView(verse: verse)
                    .tag(verse.tag)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
    
    func incrementPage() {
        verseIndex += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
