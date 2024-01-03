//
//  ContentView.swift
//  Daily Bible Verse
//
//  Created by Michael Cheng on 1/1/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var backgroundMusicPlayer: AVAudioPlayer?

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
    
    func playBackgroundMusic() {
        if let musicURL = Bundle.main.url(forResource: "music-pathfinder", withExtension: "mp3") {
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: musicURL)
                backgroundMusicPlayer?.numberOfLoops = -1 // To loop indefinitely
                backgroundMusicPlayer?.volume = 0.5 // Adjust the volume as needed
                backgroundMusicPlayer?.prepareToPlay()
                backgroundMusicPlayer?.play()
            } catch {
                print("Error loading and playing background music: \(error.localizedDescription)")
            }
        }
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
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { _ in
                    verseIndex = calculateVerseIndexForCurrentDate()
                }
                
                playBackgroundMusic()
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    if isOptionsExpanded {
                        if verseIndex != calculateVerseIndexForCurrentDate() {
                            Button(action: {
                                let calculatedVerseIndex = calculateVerseIndexForCurrentDate()
                                verseIndex = calculatedVerseIndex
                            }) {
                                Image(systemName: "house")
                                    .font(.title3)
                                    .padding(8)
                            }
                            .background(Color.white)
                            .cornerRadius(30)
                            .shadow(radius: 3)
                        }
                        
                        Button(action: {
                            let currentVerseIndex = verseIndex
                            var randomVerseIndex: Int
                            
                            repeat {
                                randomVerseIndex = Int.random(in: 0...364)
                            } while randomVerseIndex == currentVerseIndex
                            
                            verseIndex = randomVerseIndex
                        }) {
                            Image(systemName: "shuffle")
                                .font(.title3)
                                .padding(8)
                        }
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(radius: 3)
                        
                        Button(action: {
                            backgroundMusicPlayer?.stop()
                        }) {
                            Image(systemName: "gearshape")
                                .font(.title3)
                                .padding(8)
                        }
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(radius: 3)
                        
                        Button(action: {
                            let currentVerseIndex = verseIndex
                            var randomVerseIndex: Int
                            
                            repeat {
                                randomVerseIndex = Int.random(in: 0...364)
                            } while randomVerseIndex == currentVerseIndex
                            
                            verseIndex = randomVerseIndex
                        }) {
                            Image(systemName: "info.circle")
                                .font(.title3)
                                .padding(8)
                        }
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(radius: 3)
                        
                    }
                    
                    Button(action: {
                        isOptionsExpanded.toggle()
                    }) {
                        Image(systemName: isOptionsExpanded ? "xmark.circle.fill" : "ellipsis")
                            .font(.title3)
                            .padding(8)
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
