//
//  ContentView.swift
//  ARViewUsage
//
//  Created by Farkhod Kh on 31.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var isShowingCubes: Bool
    @Binding var isShowingMotionCapture: Bool
    
    var body: some View {
        VStack {
            Text("Tap to start")
            
            HStack {
                Button {
                    isShowingCubes.toggle()
                } label: {
                    
                    let label = isShowingCubes ? "Stop cubing" : "Start cubing"
                    
                    Text(label)
                }
                .modifier(AppButtonModifier())
                .padding(.bottom, 30)
                
                Button {
                    isShowingMotionCapture.toggle()
                } label: {
                    
                    let label = isShowingMotionCapture ? "Stop motion capture" : "Start motion capture"
                    
                    Text(label)
                }
                .modifier(AppButtonModifier())
                .padding(.bottom, 30)
            }

            
            if isShowingCubes {
                ARCubeViewContainer()
            }
            
            if isShowingMotionCapture {
                ARMotionViewContainer()
                    .ignoresSafeArea()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            isShowingCubes: .constant(false),
            isShowingMotionCapture: .constant(false)
        )
    }
}
