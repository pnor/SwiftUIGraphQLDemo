//
//  HomeView.swift
//  SwiftUIGraphQLDemo
//
//  Created by Phillip OReggio on 4/4/21.
//

import SwiftUI

struct HomeView: View {
    @State private var mediaShown: Media?

    func fetch() {
        Network.mediaPage(page: 0) { page in
            print("ok ready")
            self.mediaShown = page.media[0]
        }

    }

    var body: some View {
        if let mediaShown = mediaShown {
            MediaGridItem(media: mediaShown)
        } else {
            Text("looooooooading....")
              .onAppear(perform: fetch)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
