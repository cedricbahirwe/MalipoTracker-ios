//
//  TestingView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 19/02/2021.
//

import SwiftUI
import AudioToolbox


/// <#Description#>
struct TestingView: View {
    @ObservedObject var vm = MainViewModel()
    var body: some View {
        NavigationView {
            List(vm.audioFileList.compactMap{ $0 }, id: \.self) { audioFile in
                if let title = audioFile.lastPathComponent {
                    Text(title)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .onTapGesture {
                            vm.play(at: audioFile)
                        }
                }
            }
            .navigationBarTitle("System Sounds")
            .redacted(reason: vm.audioFileList.count <= 0 ? .placeholder : [])
            .onAppear(perform: vm.loadAudioFileList)
            
        }
        
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}


// MARK: - Did not initialize the audio files because it is crashing the preview due to the fact that they don't have sounds embedded
class MainViewModel: ObservableObject {
    
    @Published var audioFileList: [NSURL] = []
    

    func play(at url: NSURL) {
        var soundID = SystemSoundID();
        AudioServicesCreateSystemSoundID(url, &soundID)
        AudioServicesPlaySystemSound(soundID);
    }
    
    func loadAudioFileList() {
        let fileManager = FileManager.default
        if let enumerator:FileManager.DirectoryEnumerator = fileManager.enumerator(atPath: "/System/Library/Audio/UISounds") {
            while let element = enumerator.nextObject() as? String {
                if element.hasSuffix("caf")  { // checks the extension
                    let prefix = "file:///System/Library/Audio/UISounds/"
                    let link = NSURL(string: "\(prefix+element)")!
                    print(link)
                    audioFileList.append(link)
                    
                } else {
                    print("Carful")
                }
            }
        }
    }
    
}
