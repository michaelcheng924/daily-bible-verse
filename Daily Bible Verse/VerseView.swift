//
//  VerseView.swift
//  Daily Bible Verse
//
//  Created by Michael Cheng on 1/1/24.
//

import SwiftUI

struct VerseView: View {
    var verse: Verse
    
    var body: some View {
        VStack(spacing: 20) {
            Text(verse.esvTranslation)
            Text(verse.verse)
        }
    }
}

#Preview {
    VerseView(verse: Verse.sampleVerse)
}
