//
//  ThemeManager.swift
//  HelloTheme
//
//  Created by devlink on 2025/8/16.
//

import SwiftUI

class ThemeManager: ObservableObject {
    // @AppStorage 内部已经通过 UserDefaults 的观察机制通知视图更新，无需额外标记 @Published
    @AppStorage(StorageKeys.selectedTheme) var themeMode: ThemeMode = .light
}
