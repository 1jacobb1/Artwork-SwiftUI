//
//  ArtworkDetailView.swift
//  Artwork-SwiftUI
//
//  Created by Jacob on 2/27/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ArtworkDetailView: View {
    var artwork: Artwork
    var artistOtherArtworks: [Artwork] = []

    @State private var isSharePresented = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Spacer()
                    if let imageUrl = artwork.imageUrl {
                        WebImage(url: imageUrl)
                            .placeholder(Image(uiImage: .systemExclamationmarkIcloudFill!))
                            .resizable()
                            .scaledToFit()
                            .frame(width: nil, height: 300, alignment: .center)
                    } else {
                        Image(uiImage: .systemExclamationmarkIcloudFill!)
                            .scaledToFill()
                            .frame(height: 300)
                            .clipped()
                    }
                    Spacer()
                }

                Text(artwork.title ?? "")
                    .accessibilityLabel("Title")
                    .font(Font.system(size: 20, weight: .bold, design: .default))
                    .padding([.leading, .trailing], 20)
                    .padding(.top, 40)

                Text(artwork.artistTitle ?? "")
                    .accessibilityLabel("Artist Title")
                    .foregroundColor(Color(uiColor: .lightGray))
                    .padding([.leading, .trailing], 20)
                    .padding(.top, 5)

                Text(artwork.descriptionDisplay)
                    .accessibilityLabel("Artwork Description")
                    .padding([.leading, .trailing], 20)

                let finalArtistOtherArtworks = artistOtherArtworks.filter { $0.id != artwork.id }
                if !finalArtistOtherArtworks.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("More artworks from the artist")
                            .font(Font.system(size: 18, weight: .bold, design: .default))
                            .padding([.leading, .trailing], 20)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(finalArtistOtherArtworks, id: \.id) { artwork in
                                    Group {
                                        NavigationLink(destination: {
                                            ArtworkDetailView(artwork: artwork, artistOtherArtworks: artistOtherArtworks)
                                        }) {
                                            if let imageUrl = artwork.imageUrl {
                                                WebImage(url: imageUrl)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 120, height: 120)
                                                    .clipped()
                                            } else {
                                                Image(uiImage: .systemExclamationmarkIcloudFill!)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 120, height: 120)
                                                    .clipped()
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding([.leading, .trailing], 0)
                    }
                    .padding(.top, 20)
                }
                Spacer()
            }
        }
        .padding([.leading, .trailing], 0)
        .sheet(isPresented: $isSharePresented, content: {
            ActivityViewController(activityItems: [artwork.imageUrl as? URL])
        })
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button("Share") {
                    isSharePresented = true
                }
            }
        }
    }
}
