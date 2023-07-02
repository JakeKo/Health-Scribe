//
//  ButtonTimer.swift
//  Health Scribe Watch App
//
//  Created by Jake Koperski on 5/28/23.
//

import SwiftUI

struct ButtonTimer: View {
    @State var duration: Double
    @State var isRunning = false
    
    var pauseTime: Date {
        get {
            self.isRunning ? Date.now : Date.now + duration
        }
    }
    
    var body: some View {
        Button(action: { self.isRunning.toggle() }) {
            Text(timerInterval: Date.now...Date(timeInterval: duration, since: .now), pauseTime: pauseTime).foregroundColor(isRunning ? Color.green : Color.white)
        }
    }
}

struct ButtonTimer_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTimer(duration: 5 * 60)
    }
}
