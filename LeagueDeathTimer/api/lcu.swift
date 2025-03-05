//
// lcu.swift
// LeagueDeathTimer
//
// Created by Tohr01 on 23.02.25
// Copyright © 2025 Tohr01. All rights reserved.
//

import Foundation

struct LCUCredentials {
    let port: Int
    let password: String
}

func fetchLCUCredentials(mainAppPackagePath: URL) -> LCUCredentials? {
    let lockfileUrl = mainAppPackagePath.appending(path: "Contents/LoL/lockfile")
    // Check if lockfile exists
    if !FileManager.default.fileExists(atPath: lockfileUrl.path) { return nil }

    // Read lockfile contents
    if let content = try? String(contentsOfFile: lockfileUrl.path) {
        let credsRgx = /^\w+:\d+:(\d+):([^:]+):\w+$/
        if let match = try? credsRgx.wholeMatch(in: content) {
            let port = match.output.1
            let password = match.output.2
            return LCUCredentials(port: Int(port)!, password: String(password))
        }
    }

    return nil
}

fileprivate func getLCUBaseUrl(from creds: LCUCredentials) -> URL {
    URL(string: "https://127.0.0.1:\(creds.port)")!
}

func getClientLocale(lcuCreds: LCUCredentials) async -> String? {
    let requestUrl = getLCUBaseUrl(from: lcuCreds).appendingPathComponent("/riotclient/region-locale")
    if let response = await makeUnsecureRequest(url: requestUrl, headers: ["Authorization": generateAuthHeaderVal(creds: lcuCreds)]) as? [String: String] {
        return response["locale"]
    }
    return nil
}

fileprivate func generateAuthHeaderVal(creds: LCUCredentials) -> String {
    let concatenatedUsernamePass = "riot:\(creds.password)"
    let b64encAuth = concatenatedUsernamePass.data(using: .utf8)!.base64EncodedString()
    return "Basic \(b64encAuth)"
}
