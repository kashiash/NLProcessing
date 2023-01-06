//
//  ScanData.swift
//  NLProcessing
//
//  Created by Jacek Kosinski U on 06/01/2023.
//

import Foundation


struct ScanData : Identifiable {
    var id = UUID()
    let content:String
    init(content:String) {
        self.content = content
    }
}
