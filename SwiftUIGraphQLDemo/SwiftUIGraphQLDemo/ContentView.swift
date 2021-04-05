//
//  ContentView.swift
//  SwiftUIGraphQLDemo
//
//  Created by Phillip OReggio on 4/2/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {

    var body: some View {
        HomeView()
    }


//    var body: some View {
//        VStack(content: {
//            WebImage(url: coverImageURL)
//            Text(animeName)
//        }).onAppear(perform: {
//            Network.shared.fetch(query: SearchQuery(page: 1, search: "Attack on Titan")) { result in
//                switch result {
//                case .success(let result):
//                    print(result.data)
//                    if let name = result.data?.page?.media?[0]?.title?.romaji, let imageURL = result.data?.page?.media?[0]?.coverImage?.large {
//                        DispatchQueue.main.async {
//                            self.animeName = name
//                            self.coverImageURL = URL(string: imageURL)!
//                        }
//                    }
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//        })
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
