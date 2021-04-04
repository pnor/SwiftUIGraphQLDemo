//
//  DetailView.swift
//  SwiftUIGraphQLDemo
//
//  Created by Hanzheng Li on 4/4/21.
//

import SwiftUI
import Apollo
import SDWebImageSwiftUI

struct DetailView: View {
    var mediaID: Int
    @State var details: Detail?
    @State var coverImage: CoverImage?
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            Text(details?.title.english ?? "Title Unavailable")
            HStack(alignment: .top, spacing: nil, content: {
                WebImage(url: coverImage?.large)
                VStack(alignment: .leading, spacing: nil, content: {
                    if let episodes = details?.episodes,
                        let status = details?.status,
                        let seasonYear = details?.seasonYear {
                        Text("Released: \(String(seasonYear))\n")
                        Text("Status: \(status)\n")
                        Text("Episodes: \(episodes)\n")
                    }
                })
            })
            Text(details?.description ?? "Description Unavailable")
        }).onAppear(perform: {
            Network.shared.fetch(query: DetailQuery(id: mediaID)) { result in
                switch result {
                case .success(let response):
                    guard let media = response.data?.media,
                        let title = media.title,
                        let status = media.status?.rawValue.lowercased(),
                        let description = media.description?.replacingOccurrences(of: "<br><br>", with: "\n"),
                        let seasonYear = media.seasonYear,
                        let episodes = media.episodes,
                        let image = media.coverImage
                    else { return }
                    DispatchQueue.main.async {
                        details = Detail(
                            title: Title(
                                romaji: title.romaji,
                                english: title.english,
                                native: title.native,
                                userPreferred: title.userPreferred
                            ),
                            status: status,
                            description: description,
                            seasonYear: seasonYear,
                            episodes: episodes
                        )
                        coverImage = CoverImage(
                            medium: URL(string: image.medium ?? ""),
                            large: URL(string: image.large ?? ""),
                            extraLarge: URL(string: image.extraLarge ?? "")
                        )
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        })
        Spacer()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(mediaID: 1)
    }
}
