//
//  ARViewUsageApp.swift
//  ARViewUsage
//
//  Created by Farkhod Kh on 31.03.2023.
//

import SwiftUI

@main
struct ARViewUsageApp: App {
    @State var isShowingCubes: Bool = false
    @State var isShowingMotionCapture: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ContentView(isShowingCubes: $isShowingCubes, isShowingMotionCapture: $isShowingMotionCapture)
        }
    }
}
