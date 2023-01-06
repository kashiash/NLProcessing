//
//  SwiftUIView.swift
//  NLProcessing
//
//  Created by Jacek Kosinski U on 06/01/2023.
//

import SwiftUI
import NaturalLanguage

struct NLTextTokenizer: View {
    var inputString: String
    @State private var tokenized = [String]()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(self.inputString)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.gradient, lineWidth: 2))
                Button("Tokenize") {
                    let tokenizer = NLTokenizer(unit: .sentence)
                    tokenized = []
                    tokenizer.string = inputString
                    tokenizer.enumerateTokens(in: inputString.startIndex..<inputString.endIndex) { range, attributes in
                        tokenized.append(String(inputString[range]))
                        return true
                    }
                }
                List(tokenized, id: \.self) { token in
                    Text(token)
                }
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomTrailing)
        .padding()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NLTextTokenizer(inputString: "Nieznacznie z wilgotnego wykradał się mroku Świt bez rumieńca, wiodąc dzień bez światła w oku. Dawno wszedł dzień, a jeszcze ledwie jest widomy.\r\n Mgła wisiała nad ziemią, jak strzecha ze słomy Nad ubogą Litwina chatką; w stronie wschodu, Widać z bielszego nieco na niebie obwodu Że słońce wstało, tędy ma zstąpić na ziemię Lecz idzie niewesoło i po drodze drzemie. ")
    }
}
