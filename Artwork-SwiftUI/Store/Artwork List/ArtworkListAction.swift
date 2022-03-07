//
//  ArtworkListAction.swift
//  Artwork-SwiftUI
//
//  Created by Jacob on 2/27/22.
//

import Foundation

enum ArtworkListAction {
    case refreshList
    case loadMore
    case presentError(error: Error)
    case processArtworkResponse(data: DataListResponse<Artwork>)
    case moveArtwork(source: IndexSet, destination: Int)
}
