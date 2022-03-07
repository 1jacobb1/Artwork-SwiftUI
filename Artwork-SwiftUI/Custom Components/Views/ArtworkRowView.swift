//
//  ArtworkRowView.swift
//  Artwork-SwiftUI
//
//  Created by Jacob on 3/1/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ArtworkRowView: View {
    var artwork: Artwork

    var body: some View {
        VStack(alignment: .leading) {
            if let imageUrl = artwork.imageUrl {
                WebImage(url: imageUrl)
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()

            } else {
                Image(uiImage: .systemExclamationmarkIcloudFill!)
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()
            }

            Text(artwork.title ?? "")

            Text(artwork.artistTitle ?? "")
                .lineLimit(2)

            Text(artwork.publicationHistory ?? "")
                .lineLimit(2)

            Spacer().frame(height: 10)
        }
        .padding(.trailing, -10)
    }
}
