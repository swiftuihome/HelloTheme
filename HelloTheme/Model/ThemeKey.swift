//
//  ThemeKey.swift
//  HelloTheme
//
//  Created by devlink on 2025/8/16.
//

import SwiftUI

// MARK: - 主题环境配置
private struct ThemeKey: EnvironmentKey {
    static let defaultValue: ThemeMode = .light
}

extension EnvironmentValues {
    var themeMode: ThemeMode {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}
