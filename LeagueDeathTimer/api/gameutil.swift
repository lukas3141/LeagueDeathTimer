//
// gameutil.swift
// LeagueDeathTimer
//
// Created by Tohr01 on 04.11.24
// Copyright © 2024 Tohr01. All rights reserved.
//

import Cocoa

func gameClientRunning() -> Bool {
    return appRunning(with: AppDelegate.gameClientBundleID)
}

func leagueUxRunning() -> Bool {
    return appRunning(with: AppDelegate.leagueClientUxBundleID)
}

fileprivate func appRunning(with bundleID: String) -> Bool {
    return !NSRunningApplication.runningApplications(withBundleIdentifier: bundleID).isEmpty
}
