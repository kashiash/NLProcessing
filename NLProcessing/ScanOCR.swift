//
//  ScanOCR.swift
//  NLProcessing
//
//  Created by Jacek Kosinski U on 06/01/2023.
//

import SwiftUI

struct ScanOCR: View {

        @State private var showScannerSheet = false
        @State private var texts:[ScanData] = []
        var body: some View {
            NavigationView{
                VStack{
                    if texts.count > 0{
                        List{
                            ForEach(texts){text in
                                NavigationLink
                                    {
                                       // NLDataDetector(inputString: text.content)
                                        NLTextTokenizer(inputString: text.content)
                                    }
                                    
                                 
                                        
                                    
                                    label: {
                                        Text(text.content).lineLimit(1)
                                    }
                            }
                        }
                        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomTrailing)
                    }
                    else{
                        Text("No scan yet").font(.title)
                    }
                }
                    .navigationTitle("Scan OCR")
                    .navigationBarItems(trailing: Button(action: {
                        self.showScannerSheet = true
                    }, label: {
                        Image(systemName: "doc.text.viewfinder")
                            .font(.title)
                    })
                    .sheet(isPresented: $showScannerSheet, content: {
                        self.makeScannerView()
                    })
                    )
            }
        }
        private func makeScannerView()-> ScannerView {
            ScannerView(completion: {
                textPerPage in
                if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
                    let newScanData = ScanData(content: outputText)
                    self.texts.append(newScanData)
                }
                self.showScannerSheet = false
            })
        }
    }

struct ScanOCR_Previews: PreviewProvider {
    static var previews: some View {
        ScanOCR()
    }
}
