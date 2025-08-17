//
//  ContentView.swift
//  HelloTheme
//
//  Created by devlink on 2025/8/15.
//

import SwiftUI

// MARK: - 主视图
struct ContentView: View {
    @Environment(\.themeMode) private var themeMode
    
    var body: some View {
        VStack {
            ThemePicker()
            ThemedView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(themeMode.theme.background)
    }
}

// MARK: - 预览配置
#Preview {
    ThemeProvider {
        ContentView()
    }
}
