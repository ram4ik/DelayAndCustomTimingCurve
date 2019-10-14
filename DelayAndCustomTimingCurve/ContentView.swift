//
//  ContentView.swift
//  DelayAndCustomTimingCurve
//
//  Created by ramil on 14.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var pressShutter = false
    @State private var rotateCamera = false
    @State private var lensAnimates = false
    var body: some View {
        ZStack {
            Image(systemName: "camera.fill")
                .font(.largeTitle)
                .scaleEffect(2)
                .foregroundColor(.blue)
            // Shutter
            Circle()
            .trim(from: 1/2, to: 1)
                .frame(maxWidth: 18, maxHeight: 18)
                .foregroundColor(.blue)
                //
                .offset(x: -28, y: pressShutter ? -30 : -24)
                .animation(Animation.easeIn(duration: 0.2).delay(3).repeatForever(autoreverses: false))
            
            // Lens
            Circle()
                .frame(width: 28, height: 28)
                .foregroundColor(.blue)
                .scaleEffect(lensAnimates ? 1.25 : 1)
                .offset(y: 4)
                .animation(Animation.timingCurve(0.68, -0.55, 0.265, 1.55, duration: 0.2).delay(3.1).repeatForever(autoreverses: true))
            
        }.rotationEffect(.degrees(rotateCamera ? 12 : -12), anchor: .center)
            .animation(Animation.spring().delay(2).repeatForever(autoreverses: true))
            .onAppear() {
                self.rotateCamera.toggle()
                self.pressShutter.toggle()
                self.lensAnimates.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
