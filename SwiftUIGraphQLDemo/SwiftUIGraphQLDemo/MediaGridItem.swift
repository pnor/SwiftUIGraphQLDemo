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
            Text(media.title?.title ?? "?")
                .lineLimit(1)

            if let url = media.coverImage?.url {
                WebImage(url: url)
            }
        }.background(
            Rectangle()
            .fill(Color.secondary)
            .cornerRadius(3.0)
        )
    }
}

struct MediaGridItem_Previews: PreviewProvider {
    static var previews: some View {
        MediaGridItem(media: Media())
    }
}
