//
//  HomeView.swift
//  SwiftUIGraphQLDemo
//
//  Created by Phillip OReggio on 4/4/21.
//

import SwiftUI

struct HomeView: View {
    @State private var page: Page?

    let cellHeight: CGFloat = 190
    let backgroundColor = Color.init(red: 0.8, green: 0.8, blue: 0.8)
    let shadowColor = Color.init(red: 0.7, green: 0.7, blue: 0.7)

    let columns = [
        GridItem(.flexible(minimum: 0), spacing: 10),
        GridItem(.flexible(minimum: 0), spacing: 10)
    ]

    var body: some View {
        NavigationView {
            if let page = page {
                if page.media.count > 0 {
                    displayView(media: page.media)
                        .navigationTitle("Browse")

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
            Spacer(minLength: 10)

            LazyVGrid(columns: columns, spacing: 40) {
                ForEach(media, id: \.self) { item in
                    NavigationLink(destination: DummyDetail(media: item)) {
                        MediaGridItem(media: item)
                            .frame(height: cellHeight)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.white)
                                    .shadow(color: shadowColor, radius: 4, x: 1, y: 1)
                            )
                    }.buttonStyle(PlainButtonStyle())
                }
            }
            .animation(.linear)
            .padding(.horizontal)
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
