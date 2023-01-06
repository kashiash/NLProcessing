//
//  ContentView.swift
//  NLProcessing
//
//  Created by Jacek Kosinski U on 06/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        

            TabView {
                NLSpeechSynthesis()
                    .tabItem { Label("First", systemImage: "sun.max") }
                NLTextTokenizer(inputString: "Nieznacznie z wilgotnego wykradał się mroku Świt bez rumieńca, wiodąc dzień bez światła w oku. Dawno wszedł dzień, a jeszcze ledwie jest widomy.\r\n Mgła wisiała nad ziemią, jak strzecha ze słomy Nad ubogą Litwina chatką; w stronie wschodu, Widać z bielszego nieco na niebie obwodu Że słońce wstało, tędy ma zstąpić na ziemię Lecz idzie niewesoło i po drodze drzemie. ")
                    .tabItem { Label("Second", systemImage: "moon") }
                NLDataDetector(inputString: " Zygmuntowska street, home: 13/28, city: Gliwice Polska. Telefon do niego to +48601055393, a adres email : dupek@gmail.com  ")
                    .tabItem { Label("Third", systemImage: "cloud.drizzle") }
                ScanOCR()
                    .tabItem { Label("OCR", systemImage: "doc.text.viewfinder") }
            }
       

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
