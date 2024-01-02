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
        GeometryReader { geometry in
            ZStack{
                Image("fallLeavesBg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: geometry.size.width)
                
                VStack(spacing: 20) {
                    Text(verse.esvTranslation)
                        .padding(.horizontal, 30)
                        .font(.system(size: 36, weight: .semibold))
                        .foregroundColor(Color.white)
                        .shadow(color: Color.black, radius: 3, x: 2, y: 2)

                    Text(verse.verse)
                        .padding(.horizontal, 30)
                        .font(.system(size: 30, weight: .black))
                        .foregroundColor(Color.white)
                        .shadow(color: Color.black, radius: 3, x: 2, y: 2)
                }
            }
        }
        
        
    }
}

#Preview {
    VerseView(verse: Verse.sampleVerse)
}
