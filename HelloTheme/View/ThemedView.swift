//
//  ThemedView.swift
//  HelloTheme
//
//  Created by devlink on 2025/8/16.
//

import SwiftUI

struct ThemedView: View {
    @Environment(\.themeMode) private var themeMode
    
    var body: some View {
        ZStack {
            // 背景层
            themeMode.theme.background
                .ignoresSafeArea()
            
            // 内容层
            ScrollView {
                VStack(spacing: 24) {
                    WelcomeCard()
                    InteractiveCard()
                    FeatureGrid()
                }
                .padding(.vertical)
            }
        }
    }
}

// MARK: - 子视图组件

/// 欢迎卡片组件
private struct WelcomeCard: View {
    @Environment(\.themeMode) private var themeMode
    
    var body: some View {
        VStack(spacing: 16) {
            Text("欢迎回来！")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(themeMode.theme.accentColor)
            
            Text("让我们从零开始实现SwiftUI主题切换功能")
                .font(.subheadline)
                .foregroundStyle(themeMode.theme.textSecondary)
        }
        .cardStyle(theme: themeMode.theme)
    }
}

/// 交互卡片容器：包含开关、日期选择器和滑块
private struct InteractiveCard: View {
    @Environment(\.themeMode) private var themeMode
    
    var body: some View {
        VStack(spacing: 20) {
            ToggleRow()
            Divider().background(themeMode.theme.dividerColor)
            CustomDatePicker()
            ThemedSlider()
            ConfirmButton()
        }
        .cardStyle(theme: themeMode.theme)
    }
}

/// 开关控制行
private struct ToggleRow: View {
    @Environment(\.themeMode) private var themeMode
    @State private var isToggled = false
    
    var body: some View {
        HStack {
            Image(systemName: "sun.max.fill")
                .foregroundStyle(themeMode.theme.accentColor)
            
            Text("每日洞察")
                .font(.headline)
                .foregroundStyle(themeMode.theme.textPrimary)
            
            Spacer()
            
            Toggle("", isOn: $isToggled)
                .tint(themeMode.theme.accentColor)
        }
    }
}

/// 自定义日期选择器（适配主题）
private struct CustomDatePicker: View {
    @Environment(\.themeMode) private var themeMode
    @State private var selectedDate = Date()
    
    var body: some View {
        DatePicker("选择日期", selection: $selectedDate, displayedComponents: .date)
            .datePickerStyle(.graphical)
            .tint(themeMode.theme.accentColor)
            .colorScheme(themeMode == .dark ? .dark : .light)
    }
}

/// 主题化滑块控件
private struct ThemedSlider: View {
    @Environment(\.themeMode) private var themeMode
    @State private var sliderValue = 50.0
    
    var body: some View {
        Slider(value: $sliderValue, in: 0...100)
            .tint(themeMode.theme.accentColor)
    }
}

/// 确认按钮组件
private struct ConfirmButton: View {
    @Environment(\.themeMode) private var themeMode
    
    var body: some View {
        Button(action: {}) {
            Text("确认选择")
                .font(.headline)
                .foregroundColor(themeMode.theme.buttonText)
                .frame(maxWidth: .infinity)
                .padding()
                .background(themeMode.theme.accentColor)
                .cornerRadius(12)
        }
    }
}

/// 功能网格布局（2列）
private struct FeatureGrid: View {
    @Environment(\.themeMode) private var themeMode
    
    let features = [
        ("leaf.fill", "自然"),
        ("drop.fill", "水源"),
        ("flame.fill", "能源"),
        ("bolt.fill", "电力")
    ]
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            ForEach(features, id: \.0) { icon, title in
                FeatureItem(icon: icon, title: title)
            }
        }
        .padding(.horizontal)
        .shadow(color: themeMode.theme.shadowColor, radius: 6, x: 0, y: 3)
    }
}

/// 单个功能项组件
private struct FeatureItem: View {
    @Environment(\.themeMode) private var themeMode
    let icon: String
    let title: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title)
                .foregroundStyle(themeMode.theme.accentColor)
                .padding(12)
                .background(themeMode.theme.secondaryBackground.opacity(0.7))
                .clipShape(Circle())
            
            Text(title)
                .font(.caption)
                .foregroundStyle(themeMode.theme.textPrimary)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 100)
        .background(themeMode.theme.cardBackground)
        .cornerRadius(12)
    }
}

// MARK: - 视图修饰器

extension View {
    func cardStyle(theme: AppTheme) -> some View {
        self
            .padding()
            .frame(maxWidth: .infinity)
            .background(theme.cardBackground)
            .cornerRadius(16)
            .shadow(color: theme.shadowColor, radius: 6, x: 0, y: 3)
            .padding(.horizontal)
    }
}


// MARK: - 预览配置
#Preview {
    ThemeProvider {
        ThemedView()
    }
}
