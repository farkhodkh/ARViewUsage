//
//  AppButtonModifier.swift
//  ARViewUsage
//
//  Created by Farkhod Kh on 31.03.2023.
//

import SwiftUI

struct AppButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
