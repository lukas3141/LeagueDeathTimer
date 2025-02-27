//
// wallpaper.swift
// LeagueDeathTimer
//
// Created by Tohr01 on 14.02.25
// Copyright © 2025 Tohr01. All rights reserved.
//
import Cocoa

func getWallpaperUrl() -> URL? {
    NSWorkspace.shared.desktopImageURL(for: NSScreen.main!)
}
