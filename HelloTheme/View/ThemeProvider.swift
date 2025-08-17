//
//  ThemeProvider.swift
//  HelloTheme
//
//  Created by devlink on 2025/8/16.
//

import SwiftUI

struct ThemeProvider<Content: View>: View {
    @StateObject private var themeManager = ThemeManager()
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .environmentObject(themeManager)
            .environment(\.themeMode, themeManager.themeMode)
    }
}
