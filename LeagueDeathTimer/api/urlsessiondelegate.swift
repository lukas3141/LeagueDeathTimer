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

func makeUnsecureRequest(url: URL, headers: [String: String] = [:]) async -> Any? {
    var urlRequest = URLRequest(url: url)

    for (key, val) in headers {
        urlRequest.addValue(val, forHTTPHeaderField: key)
    }
    guard let (data, _) = try? await URLSession(configuration: .default, delegate: CertIgnoreURLSessionDelegate(), delegateQueue: .main).data(for: urlRequest),
          let e = try? JSONSerialization.jsonObject(with: data)
    else {
        return nil
    }
    return e
}
