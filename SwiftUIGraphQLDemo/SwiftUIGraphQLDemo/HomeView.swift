//
//  HomeView.swift
//  SwiftUIGraphQLDemo
//
//  Created by Phillip OReggio on 4/4/21.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        VStack {
            Button("Press Me (:") {
                Network.search({ page in
                    print(page)
                })
            }

            Text("!")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
