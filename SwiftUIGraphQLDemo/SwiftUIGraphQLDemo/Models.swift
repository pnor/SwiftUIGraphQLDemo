//
//  Media.swift
//  SwiftUIGraphQLDemo
//
//  Created by Phillip OReggio on 4/4/21.
//

import Foundation

struct Detail: Codable {

    let title: Title
    let status: String
    let description: String
    let seasonYear: Int
    let episodes: Int
}

struct Title: Codable {
    let romaji: String?
    let english: String?
    let native: String?
    let userPreferred: String?
}

struct CoverImage: Codable {
    let medium: URL?
    let large: URL?
    let extraLarge: URL?
}
