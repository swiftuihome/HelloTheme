//
//  ThemeMode.swift
//  HelloTheme
//
//  Created by devlink on 2025/8/16.
//

import SwiftUI

// MARK: - 主题模式
enum ThemeMode: String, CaseIterable {
    case light = "亮色"
    case dark = "暗色"
    
    var theme: AppTheme {
        switch self {
        case .light: return .light
        case .dark: return .dark
        }
    }
}

// MARK: - 主题配置
struct AppTheme {
    let background: Color         // 主背景色（纯色）
    let cardBackground: Color     // 卡片背景色
    let textPrimary: Color        // 主要文字颜色
    let textSecondary: Color      // 次要文字颜色
    let accentColor: Color        // 强调色
    let secondaryBackground: Color // 次要背景色
    let dividerColor: Color       // 分隔线颜色
    let shadowColor: Color        // 阴影颜色
    let buttonText: Color         // 按钮文字颜色
    
    static let light = AppTheme(
        background: Color(hex: "F5F7FA"),  // 浅灰蓝色
        cardBackground: Color.white,
        textPrimary: Color(hex: "2C3E50"),
        textSecondary: Color(hex: "5D6D7E"),
        accentColor: Color(hex: "3498DB"),
        secondaryBackground: Color(hex: "EAF2F8"),
        dividerColor: Color(hex: "EAEDED"),
        shadowColor: Color.black.opacity(0.1),
        buttonText: Color.white
    )
    
    static let dark = AppTheme(
        background: Color(hex: "121212"),  // 深灰背景
        cardBackground: Color(hex: "1E1E1E"),
        textPrimary: Color(hex: "F5F5F5"),
        textSecondary: Color(hex: "BDBDBD"),
        accentColor: Color(hex: "FFA726"),
        secondaryBackground: Color(hex: "2D2D2D"),
        dividerColor: Color(hex: "3D3D3D"),
        shadowColor: Color.black.opacity(0.3),
        buttonText: Color(hex: "121212")
    )
}

// 扩展Color以支持十六进制颜色初始化
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}
