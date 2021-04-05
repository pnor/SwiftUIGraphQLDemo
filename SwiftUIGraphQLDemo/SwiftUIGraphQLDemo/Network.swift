//
//  Network.swift
//  SwiftUIGraphQLDemo
//
//  Created by Hanzheng Li on 4/3/21.
//

import Foundation
import Apollo
import Combine

// class Network {
//     static let shared = Network()
//     let apollo = ApolloClient(url: URL(string: "https://graphql.anilist.co/"))
// }
//
// extension ApolloClient {
//     func fetch<Query: GraphQLQuery>(query: Query) -> GraphQLPublisher<Query>() {
//
//     }
// }
//
// enum WrappedGraphQLError: Error {
//     case graphQL([GraphQLError])
//     case some(Error)
//     case noData
//
// }


class Network {
    static let shared = ApolloClient(url: URL(string: "https://graphql.anilist.co/")!)

    static func search(_ completion: @escaping (Page) -> Void) {
        Network.shared.fetch(query: SearchQuery(page: 1, search: "Attack on Titan")) { result in
            switch result {
            case .success(let result):
                guard let page = result.data?.page else { return }
                print(page)

                // TODO ):

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    static func mediaPage(page: Int, _ completion: @escaping (Page) -> Void) {
        Network.shared.fetch(query: MediaPageQuery(page: page)) { result in
            switch result {
            case .success(let result):
                guard let page = result.data?.page else { return }
                let pageResult = Page(from: page)

                completion(pageResult)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
