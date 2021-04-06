//
//  MediaGridItem.swift
//  SwiftUIGraphQLDemo
//
//  Created by Phillip OReggio on 4/4/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MediaGridItem: View {
    var media: Media

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(media.title?.title ?? "?")
                    .font(.headline)
                    .lineLimit(2)
                Spacer()
            }

            HStack {
                if let seasonYear = media.seasonYear {
                    Text(verbatim: "\(seasonYear)")
                        .font(.subheadline)
                }
                Spacer()
            }

            if let url = media.coverImage?.url {
                WebImage(url: url)
            }
            Spacer()
        }
    }
}

struct MediaGridItem_Previews: PreviewProvider {
    static var previews: some View {
        MediaGridItem(media: Media())
    }
}
