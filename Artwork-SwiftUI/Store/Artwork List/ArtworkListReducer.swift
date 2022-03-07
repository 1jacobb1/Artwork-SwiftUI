//
//  ArtworkListReducer.swift
//  Artwork-SwiftUI
//
//  Created by Jacob on 2/27/22.
//

import Combine
import SwiftUI
import Moya

func artworkListReducer(state: inout ArtworkListState,
                        action: ArtworkListAction,
                        environment: World) -> AnyPublisher<ArtworkListAction, Never> {
    switch action {
    case .refreshList:
        if state.isRequesting { break }
        state.isRequesting = true
        return environment.apiService.getArtworks(page: 1)
            .map { ArtworkListAction.processArtworkResponse(data: $0) }
            .catch { Just(ArtworkListAction.presentError(error: $0)) }
            .eraseToAnyPublisher()
    case .loadMore:
        guard let pagination = state.pagination,
              pagination.hasNext,
              !state.isRequesting else { break }
        state.isRequesting = true
        let nextPage = pagination.currentPage + 1
        return environment.apiService.getArtworks(page: nextPage)
            .map { ArtworkListAction.processArtworkResponse(data: $0) }
            .catch { Just(ArtworkListAction.presentError(error: $0)) }
            .eraseToAnyPublisher()

    case .presentError(error: let error):
        if state.isRequesting {
            state.isRequesting = false
        }
        state.presentApiErrorMessage = error.localizedDescription
        break

    case .processArtworkResponse(let response):
        if state.isRequesting {
            state.isRequesting = false
        }

        let artworks = response.data
        let currentPage = response.pagination?.currentPage ?? 1

        state.pagination = response.pagination

        if currentPage == 1 {
            state.artworks = artworks
        } else {
            let currentArtworks = state.artworks
            state.artworks = currentArtworks + artworks
        }

        if state.artworksInGroup.isEmpty {
            state.artworksInGroup = Dictionary(grouping: state.artworks, by: { $0.artistId })
                .map { key, value -> GroupedArtwork in
                    GroupedArtwork(artworks: value, artistId: key ?? 0)
                }
        } else {
            var groupedArtworks = state.artworksInGroup
            artworks.forEach { artwork in
                if let index = groupedArtworks.firstIndex(where: { $0.artistId == artwork.artistId }) {
                    if !groupedArtworks[index].artworks.contains(where: { $0.id == artwork.id }) {
                        groupedArtworks[index].artworks.append(artwork)
                    }
                } else {
                    groupedArtworks.append(GroupedArtwork(artworks: [artwork], artistId: artwork.artistId ?? 0))
                }
            }
            state.artworksInGroup = groupedArtworks
        }

        var featuredArtworks: [Artwork] = []
        state.artworks.forEach { artwork in
            if !featuredArtworks.contains(where: { $0.artistId == artwork.artistId }) {
                var modifiedArtwork = artwork
                modifiedArtwork.exhibitionHistory = nil
                modifiedArtwork.publicationHistory = nil
                featuredArtworks.append(modifiedArtwork)
            }
        }
        state.featuredArtworks = featuredArtworks
        break

    case .moveArtwork(let source, let destination):
        state.artworks.move(fromOffsets: source, toOffset: destination)
        break
    }
    return Empty().eraseToAnyPublisher()
}
