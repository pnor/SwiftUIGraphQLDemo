//
//  DummyDetail.swift
//  SwiftUIGraphQLDemo
//
//  Created by Phillip OReggio on 4/5/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DummyDetail: View {
    var media: Media

    var body: some View {
        VStack {
            Text(media.title?.title ?? "?")
            if let url = media.coverImage?.url {
                WebImage(url: url)
            }
        }
    }
}

struct DummyDetail_Previews: PreviewProvider {
    static var previews: some View {
        DummyDetail(media: Media())
    }
}
