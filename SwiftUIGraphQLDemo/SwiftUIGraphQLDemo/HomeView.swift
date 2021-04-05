//
//  HomeView.swift
//  SwiftUIGraphQLDemo
//
//  Created by Phillip OReggio on 4/4/21.
//

import SwiftUI

struct HomeView: View {
    @State private var page: Page?

    let columns = [
        GridItem(.flexible(minimum: 80), spacing: 10),
        GridItem(.flexible(minimum: 80), spacing: 10),
        GridItem(.flexible(minimum: 80), spacing: 10)
    ]

    var body: some View {
        NavigationView {
            if let page = page {
                if page.media.count > 0 {
                    displayView(media: page.media)
                      .navigationTitle("Welcome to SwiftUIGraphQLDemo!")

                } else {
                    displayEmpty()
                }
            } else {
                loadingView()
                  .onAppear(perform: fetch)
            }
        }
    }

    private func loadingView() -> some View {
        Text("looooooooading....")

    }

    private func displayView(media: [Media]) -> some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(media, id: \.self) { item in
                    NavigationLink(destination: DummyDetail(media: item)) {
                        MediaGridItem(media: item)
                    }.buttonStyle(PlainButtonStyle())
                }
            }.padding(.horizontal)
        }
    }

    private func displayEmpty() -> some View {
        Text("The page is empty")
    }

    private func fetch() {
        Network.mediaPage(page: 0) { page in
            print("ok ready")
            self.page = page
        }
    }


}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
