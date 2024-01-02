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
    @State private var isOptionsExpanded = false
    
    init() {
        let calculatedVerseIndex = calculateVerseIndexForCurrentDate()
        _verseIndex = State(initialValue: calculatedVerseIndex)
    }
    
    func calculateVerseIndexForCurrentDate() -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        
        let year = calendar.component(.year, from: currentDate)
        let startOfYear = calendar.date(from: DateComponents(year: year, month: 1, day: 1))!
        
        let daysBetween = calendar.dateComponents([.day], from: startOfYear, to: currentDate)
        return daysBetween.day ?? 0
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $verseIndex) {
                ForEach(verses) { verse in
                    VerseView(verse: verse)
                        .tag(verse.tag)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    if isOptionsExpanded {
                        Button(action: {
                            // Handle the action for the first option
                        }) {
                            Image(systemName: "option1Icon")
                                .font(.title)
                                .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(radius: 3)
                        .transition(.move(edge: .trailing))
                        
                        Button(action: {
                            // Handle the action for the second option
                        }) {
                            Image(systemName: "option2Icon")
                                .font(.title)
                                .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(radius: 3)
                        .transition(.move(edge: .trailing))
                        
                        // Add more buttons for additional options as needed
                        
                    }
                    
                    Button(action: {
                        isOptionsExpanded.toggle()
                    }) {
                        Image(systemName: isOptionsExpanded ? "xmark.circle.fill" : "ellipsis")
                            .font(.title)
                            .padding()
                    }
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(radius: 3)
                    .onTapGesture {
                        withAnimation {
                            isOptionsExpanded.toggle()
                        }
                    }
                    
                    Spacer()
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
