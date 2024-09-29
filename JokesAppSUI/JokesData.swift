//
//  JokesData.swift
//  JokesAppSUI
//
//  Created by Dilara Akdeniz on 26.07.2023.
//



//İnternete Json 2 Swift yazıp quicktype.io sitesine girerek JSON veriyi yapıştırırsak bize structları kendisi olulturur. Direkt ordan alabiliriz.

import Foundation

struct Welcome: Identifiable, Codable {
    let id = UUID()
    let type: String
    let value: [Value]
}

struct Value: Identifiable, Codable {
    let id: Int
    let joke: String
    let categories: [String]
}
