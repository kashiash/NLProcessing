//
//  SwiftUIView.swift
//  NLProcessing
//
//  Created by Jacek Kosinski U on 06/01/2023.
//

import SwiftUI
import NaturalLanguage

struct NLTextTokenizer: View {
    @State private var text = "Checkout DevTechie for more on iOS development content. DevTechie helps you learn by building examples."
    @State private var tokenized = [String]()
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.gradient, lineWidth: 2))
            Button("Tokenize") {
                let tokenizer = NLTokenizer(unit: .sentence)
                tokenized = []
                tokenizer.string = text
                tokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { range, attributes in
                    tokenized.append(String(text[range]))
                    return true
                }
            }
            List(tokenized, id: \.self) { token in
                Text(token)
            }
        }
        .padding()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NLTextTokenizer()
    }
}
