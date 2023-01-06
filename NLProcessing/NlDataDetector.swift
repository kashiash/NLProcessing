//
//  NlDataDetector.swift
//  NLProcessing
//
//  Created by Jacek Kosinski U on 06/01/2023.
//

import SwiftUI

struct NLDataDetector: View {
    var  inputString: String
       @State private var results = [String]()
       
       let detector = try! NSDataDetector(
           types: NSTextCheckingResult.CheckingType.link.rawValue | NSTextCheckingResult.CheckingType.address.rawValue |
         NSTextCheckingResult.CheckingType.phoneNumber.rawValue
       )
       
       var body: some View {
           NavigationStack {
               VStack {
                   
                   Text( self.inputString)
                       .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.orange.gradient, lineWidth: 2))
                      
                   Button("Process") {
                       results = []
                       let range = NSRange(0..<inputString.count)
                       let foundContent = detector.matches(
                         in: inputString,
                         options: [], range: range)
                       
                       foundContent.forEach { content in
                           switch content.resultType {
                           case NSTextCheckingResult.CheckingType.link:
                               results.append("\(content.url!)")
                               
                           case NSTextCheckingResult.CheckingType.address:
                               let city = content.addressComponents![NSTextCheckingKey.city] ?? ""
                               let street =
                               content.addressComponents![NSTextCheckingKey.street] ?? ""
                               let state = content.addressComponents![NSTextCheckingKey.state] ?? ""
                               results.append("Address: \(street), \(city), \(state)")
                               
                           case NSTextCheckingResult.CheckingType.phoneNumber:
                               results.append("Phone Number: \(content.phoneNumber!)")
                               
                           default:
                               break
                           }
                       }
                   }
                   .buttonStyle(.borderedProminent)
                   
                   List(results, id: \.self) { item in
                       Text(item)
                   }
               }
               
             
               
         
           }
           .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomTrailing)
           .padding()
       }
}

struct NLDataDetector_Previews: PreviewProvider {
    static var previews: some View {
        NLDataDetector(inputString: " Zygmuntowska street, home: 13/28, city: Gliwice Polska. Telefon do niego to +48601055393, a adres email : dupek@gmail.com  ")
    }
}
