//
//  FeaturedArtworksView.swift
//  Artwork-SwiftUI
//
//  Created by Jacob on 2/28/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct FeaturedArtworksView: View {
    var featuredArtworks: [Artwork]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Featured Artworks")
                .font(Font.system(size: 20, weight: .bold, design: .default))
                .padding([.leading, .trailing], 0)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(featuredArtworks, id: \.id) { artwork in
                        Group {
                            NavigationLink(destination: { ArtworkDetailView(artwork: artwork) }) {
                                if let imageUrl = artwork.imageUrl {
                                    WebImage(url: imageUrl)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 250)
                                        .clipped()
                                } else {
                                    Image(uiImage: .systemExclamationmarkIcloudFill!)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 250)
                                        .clipped()
                                }
                            }
                        }
                    }
                }
            }
            .padding([.leading, .trailing], 0)

            Spacer().frame(height: 10)
        }
    }
}
