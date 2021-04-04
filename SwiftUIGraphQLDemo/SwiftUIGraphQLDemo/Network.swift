//
//  Network.swift
//  SwiftUIGraphQLDemo
//
//  Created by Hanzheng Li on 4/3/21.
//

import Foundation
import Apollo

class Network {
    static let shared = ApolloClient(url: URL(string: "https://graphql.anilist.co/")!)
    
}
