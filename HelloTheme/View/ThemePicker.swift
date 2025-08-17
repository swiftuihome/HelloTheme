//
//  ThemePicker.swift
//  HelloTheme
//
//  Created by devlink on 2025/8/16.
//

import SwiftUI

// MARK: - 子视图组件
struct ThemePicker: View {
    @EnvironmentObject private var themeManager: ThemeManager
    
    var body: some View {
        Picker(selection: $themeManager.themeMode) {
            ForEach(ThemeMode.allCases, id: \.self) { mode in
                Text(mode.rawValue)
                    .tag(mode)
            }
        } label: {
            Text("选择主题")
        }
        .tint(themeManager.themeMode.theme.textPrimary) // 使用当前主题的文字颜色
    }
}
