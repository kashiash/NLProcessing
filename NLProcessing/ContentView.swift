//
//  ContentView.swift
//  NLProcessing
//
//  Created by Jacek Kosinski U on 06/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           // NLSpeechSynthesis()
            NLTextTokenizer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
