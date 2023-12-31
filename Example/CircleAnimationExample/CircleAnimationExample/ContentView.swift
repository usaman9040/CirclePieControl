//
//  ContentView.swift
//  CircleAnimationExample
//
//  Created by usaman9040 on 07/08/2023.
//

import SwiftUI
import CirclePieControl

struct ContentView: View {
    
    @State var progress: Double = 0.0
    
    /// Add smaller value to make smooth animation
    /// 0.1 representing after every (0.1)sec update the value
    /// 30.0 representing total time after it reset
    let progressAddOn = 0.1/30.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        CircleAnimation(progress: progress)
            .foregroundFill(.gray)
            .backgroundFill(.gray.opacity(0.1))
            .frame(width: 200, height: 200)
            .onReceive(timer) { _ in
                updateProgress()
            }
    }
    
    private func updateProgress() {
        progress += progressAddOn
        if progress >= 1 {
            progress = 0.0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
