//
//  ArtworkListState.swift
//  Artwork-SwiftUI
//
//  Created by Jacob on 2/27/22.
//

struct GroupedArtwork {
    var artworks: [Artwork]
    var artistId: Int

    static let sample: [GroupedArtwork] = {
        var artworks: [GroupedArtwork] = []
        for i in 0..<10 {
            let id = i + 1
            var grouped = GroupedArtwork(artworks: [.sample, .sample], artistId: id)
            artworks.append(grouped)
        }
        return artworks
    }()
}

struct ArtworkListState {
    var presentApiErrorMessage: String? = nil
    var isRequesting = false
    var artworks: [Artwork] = []
    var artworksInGroup: [GroupedArtwork] = []
    var reloadArtworksInGroup = false
    var featuredArtworks: [Artwork] = []
    var pagination: Pagination? = nil
    var selectedArtwork: Artwork? = nil
}
