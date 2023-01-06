import AVKit
import NaturalLanguage
import SwiftUI

struct NLSpeechSynthesis: View {
    
    @ObservedObject var model = Model()
    @State private var text = ""
    let recognizer = NLLanguageRecognizer()
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
           
            TextEditor(text: $text)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                .padding()
            Button("Load story"){
                
                    text = self.model.data
                  
              
            }
            Button("Speak") {

                recognizer.processString(text)
                let lang = recognizer.dominantLanguage!.rawValue
                
                let utterance = AVSpeechUtterance(string: text)
                utterance.voice = AVSpeechSynthesisVoice(language: lang)
                
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
                    try AVAudioSession.sharedInstance().setActive(true)
                } catch {
                    print(error.localizedDescription)
                }
                
                speechSynthesizer.speak(utterance)
            }
        }.onAppear{
            text = self.model.data
            print(text)
        }
    }
}

class Model: ObservableObject {
    @Published var data: String = ""
    init() { self.load(file: "PanTadeusz") }
    func load(file: String) {
        if let filepath = Bundle.main.path(forResource: file, ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                DispatchQueue.main.async {
                    self.data = contents
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } else {
            print("File not found")
        }
    }
}
