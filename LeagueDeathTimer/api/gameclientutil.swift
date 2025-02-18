//
// gameclientutil.swift
// LeagueDeathTimer
//
// Created by Tohr01 on 04.11.24
// Copyright © 2024 Tohr01. All rights reserved.
//

import Cocoa

func gameClientRunning() -> Bool {
    return !NSRunningApplication.runningApplications(withBundleIdentifier: AppDelegate.gameClientBundleID).isEmpty
}
