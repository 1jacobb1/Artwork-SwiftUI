//
//  ArtworkListView.swift
//  Artwork-SwiftUI
//
//  Created by Jacob on 2/27/22.
//

import SwiftUI

struct ArtworkListView: View {
    @EnvironmentObject var store: AppStore
    @State private var editMode = EditMode.inactive

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                List {
                    if !store.state.artworkListState.featuredArtworks.isEmpty {
                        FeaturedArtworksView(featuredArtworks: store.state.artworkListState.featuredArtworks)
                    }

                    ForEach(store.state.artworkListState.artworks, id: \.id) { artwork in
                        ZStack {
                            ArtworkRowView(artwork: artwork)
                            NavigationLink(destination: {
                                let otherArtworks = store.state.artworkListState.artworks
                                    .filter { $0.artistId == artwork.artistId }
                                ArtworkDetailView(artwork: artwork, artistOtherArtworks: otherArtworks)
                            }) {
                                EmptyView()
                            }
                            .opacity(0)
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .onAppear(perform: {
                            if let lastArtwork = store.state.artworkListState.artworks.last,
                               lastArtwork.id == artwork.id {
                                loadMore()
                            }
                        })
                    }
                    .onMove(perform: onMove)
                }
                .listStyle(PlainListStyle())
                .environment(\.editMode, $editMode)
                .refreshable {
                    refreshList()
                }
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        let buttonTitle = editMode == .active ? "Done" : "Edit"
                        Button(buttonTitle, action: toggleEditMode)
                    }
                }
            }
            .navigationTitle("Artworks")
        }
        .onAppear(perform: refreshList)
    }

    private func refreshList() {
        store.send(.artworkListView(action: .refreshList))
    }

    private func loadMore() {
        store.send(.artworkListView(action: .loadMore))
    }

    private func onMove(source: IndexSet, destination: Int) {
        store.send(.artworkListView(action: .moveArtwork(source: source, destination: destination)))
    }

    private func toggleEditMode() {
        editMode = editMode == .active ? .inactive : .active
    }
}
