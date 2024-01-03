//
//  VerseView.swift
//  Daily Bible Verse
//
//  Created by Michael Cheng on 1/1/24.
//

import SwiftUI

struct VerseView: View {
    var verse: Verse
    var isEsv: Bool
    
    var imageNames = ["fallLeavesBg", "purpleFlowersBg", "lightTreesBg", "waterSunBg", "leavesBg", "purpleWaterBg", "treeLightBg", "mountainCloudsBg"]
    
    var imageIndex: Int {
        return verse.tag % imageNames.count
    }
    
    func calculateDate(forTag tag: Int) -> Date? {
        let calendar = Calendar.current
        let currentDate = Date()
        
        // Calculate the date for the given tag within the current year
        var dateComponents = DateComponents()
        dateComponents.year = calendar.component(.year, from: currentDate)
        dateComponents.day = tag + 1 // Add 1 to tag to make it 1-based (e.g., 1 for the first day)
        
        return calendar.date(from: dateComponents)
    }
    
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image(imageNames[imageIndex])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: geometry.size.width)
                
                VStack(spacing: 30) {
                    if shouldDisplayDate() {
                        Text(formattedDate())
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color.white)
                            .shadow(color: Color.black, radius: 3, x: 2, y: 2)
                    }
                    
                    Group {
                        if isEsv {
                            Text(verse.esvTranslation)
                        } else {
                            Text(verse.kjvTranslation)
                        }
                    }
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
    
    // Check if the current date matches the date of the verse
    private func shouldDisplayDate() -> Bool {
        if let verseDate = calculateDate(forTag: verse.tag) {
            let currentDate = Date()
            let calendar = Calendar.current
            return calendar.isDate(currentDate, inSameDayAs: verseDate)
        }
        return false
    }
    
    // Format the date for display
    private func formattedDate() -> String {
        if let verseDate = calculateDate(forTag: verse.tag) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM dd, yyyy"
            return dateFormatter.string(from: verseDate)
        }
        return ""
    }
}

#Preview {
    VerseView(verse: Verse.sampleVerse, isEsv: true)
}
