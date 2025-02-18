//
// Settings.swift
// LeagueDeathTimer
//
// Created by Tohr01 on 14.02.25
// Copyright © 2025 Tohr01. All rights reserved.
//

import LaunchAtLogin
import SwiftUI

struct Settings: View {
    @State var rectW: CGFloat = 0
    @State var rectH: CGFloat = 0
    @State var screenPosition: ScreenPosition = UserDefaults.standard.value(forKey: "popupScreenPosition") as? ScreenPosition ?? .bottomCenter
    let windowW: CGFloat = 517

    let screenLocationRectW: CGFloat = 50
    let screenLocationRectH: CGFloat = 20
    let highlightColor: Color = .red

    var body: some View {
        VStack(alignment: .leading) {
            Text("Pop-up screen location")
                .font(.headline)
            Text("At which location should the pop-up appear on your screen?")
                .font(.footnote)
            ZStack {
                AsyncImage(url: getWallpaperUrl()) { result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                        .frame(width: rectW, height: rectH)
                        .opacity(0.3)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.blue, lineWidth: 2)
                }
                VStack(alignment: .center) {
                    HStack {
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .fill(screenPosition == .topLeft ? highlightColor : Color.primary)
                            .onTapGesture { saveNewPopupScreenLocation(screenpos: .topLeft) }
                            .frame(width: screenLocationRectW, height: screenLocationRectH)
                        Spacer()
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .fill(screenPosition == .topCenter ? highlightColor : Color.primary)
                            .onTapGesture { saveNewPopupScreenLocation(screenpos: .topCenter) }
                            .frame(width: screenLocationRectW, height: screenLocationRectH)
                        Spacer()
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .fill(screenPosition == .topRight ? highlightColor : Color.primary)
                            .onTapGesture { saveNewPopupScreenLocation(screenpos: .topRight) }
                            .frame(width: screenLocationRectW, height: screenLocationRectH)
                    }

                    Spacer()

                    HStack {
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .fill(screenPosition == .centerLeft ? highlightColor : Color.primary)
                            .onTapGesture { saveNewPopupScreenLocation(screenpos: .centerLeft) }
                            .frame(width: screenLocationRectW, height: screenLocationRectH)
                        Spacer()
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .fill(screenPosition == .centerRight ? highlightColor : Color.primary)
                            .onTapGesture { saveNewPopupScreenLocation(screenpos: .centerRight) }
                            .frame(width: screenLocationRectW, height: screenLocationRectH)
                    }

                    Spacer()

                    HStack {
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .fill(screenPosition == .bottomLeft ? highlightColor : Color.primary)
                            .onTapGesture { saveNewPopupScreenLocation(screenpos: .bottomLeft) }
                            .frame(width: screenLocationRectW, height: screenLocationRectH)
                        Spacer()
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .fill(screenPosition == .bottomCenter ? highlightColor : Color.primary)
                            .onTapGesture { saveNewPopupScreenLocation(screenpos: .bottomCenter) }
                            .frame(width: screenLocationRectW, height: screenLocationRectH)
                        Spacer()
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .fill(screenPosition == .bottomRight ? highlightColor : Color.primary)
                            .onTapGesture { saveNewPopupScreenLocation(screenpos: .bottomRight) }
                            .frame(width: screenLocationRectW, height: screenLocationRectH)
                    }
                }
                .padding()
            }
            .frame(width: rectW, height: rectH)
            .clipped()

            Divider()

            Form {
                LaunchAtLogin.Toggle()
                    .font(.headline)
                Text("The Pop-up will only show once the game client is running.")
                    .font(.footnote)
            }
        }
        .frame(width: windowW)
        .padding()
        .onAppear {
            let screenW = NSScreen.main!.frame.width
            let screenH = NSScreen.main!.frame.height
            let aspectRatio = screenW / screenH
            rectW = windowW
            rectH = windowW / aspectRatio
        }
    }

    func saveNewPopupScreenLocation(screenpos: ScreenPosition) {
        UserDefaults.standard.set(screenpos.rawValue, forKey: "popupScreenPosition")
        screenPosition = screenpos
    }
}

#Preview {
    Settings()
}
