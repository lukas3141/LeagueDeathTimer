//
// datadragon.swift
// LeagueDeathTimer
//
// Created by Tohr01 on 04.11.24
// Copyright © 2024 Tohr01. All rights reserved.
//

import Foundation

func getNewestVersion() async -> String? {
    let versionUrl = URL(string: "https://ddragon.leagueoflegends.com/api/versions.json")!
    let request = URLRequest(url: versionUrl)
    guard let (data, _) = try? await URLSession.shared.data(for: request),
          let versions = try? JSONSerialization.jsonObject(with: data) as? [String]
    else {
        return nil
    }
    return versions[0]
}

func getChampionSplashURL(championName: String) async -> URL? {
    let reqURL = URL(string: "https://ddragon.leagueoflegends.com/cdn/14.21.1/data/\(AppDelegate.leagueLocale)/champion.json")!
    let request = URLRequest(url: reqURL)
    guard let (data, _) = try? await URLSession.shared.data(for: request),
          let dict = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
          let dictData = dict["data"] as? [String: [String: Any]],
          let champ = dictData.filter({ $0.value["name"] as! String == championName }).first
    else {
        return nil
    }
    return URL(string: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(champ.key)_0.jpg")
}
