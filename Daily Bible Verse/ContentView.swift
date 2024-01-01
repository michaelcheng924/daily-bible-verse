//
//  ContentView.swift
//  Daily Bible Verse
//
//  Created by Michael Cheng on 1/1/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        Image("bgImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
