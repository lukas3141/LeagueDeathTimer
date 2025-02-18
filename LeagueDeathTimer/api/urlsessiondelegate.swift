//
// urlsessiondelegate.swift
// LeagueDeathTimer
//
// Created by Tohr01 on 04.11.24
// Copyright © 2024 Tohr01. All rights reserved.
//

import Foundation

class CertIgnoreURLSessionDelegate: NSObject, URLSessionDelegate {
    func urlSession(_: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
    }
}
