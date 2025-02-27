//
// gameutil.swift
// LeagueDeathTimer
//
// Created by Tohr01 on 04.11.24
// Copyright © 2024 Tohr01. All rights reserved.
//

import Cocoa

func gameClientRunning() -> Bool {
    appRunning(with: AppDelegate.gameClientBundleID)
}

func leagueUxRunning() -> Bool {
    appRunning(with: AppDelegate.leagueClientUxBundleID)
}

private func appRunning(with bundleID: String) -> Bool {
    !NSRunningApplication.runningApplications(withBundleIdentifier: bundleID).isEmpty
}
