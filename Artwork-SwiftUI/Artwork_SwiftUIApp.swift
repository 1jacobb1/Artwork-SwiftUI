//
//  Artwork_SwiftUIApp.swift
//  Artwork-SwiftUI
//
//  Created by Jacob on 2/27/22.
//

import SwiftUI

@main
struct Artwork_SwiftUIApp: App {

    let store = AppStore(initialState: .init(),
                         reducer: AppReducer.appReducer,
                         environment: World())

    var body: some Scene {
        WindowGroup {
            ArtworkListView()
                .environmentObject(store)
        }
    }
}
