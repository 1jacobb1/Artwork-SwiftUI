//
//  ArtworkApiService.swift
//  Artwork
//
//  Created by Jacob on 2/23/22.
//

import Moya
import Combine

struct ArtworkApiService: ApiServiceType {
    let provider = MoyaProvider<ArtworkAPI>(plugins: [NetworkLoggerPlugin()])

    static let environment: APIEnvironment = .production

    func getArtworks(page: Int) -> AnyPublisher<DataListResponse<Artwork>, MoyaError> {
        return provider.requestPublisher(.artworks(parameters: ["page": page]))
            .filterSuccessfulStatusCodes()
            .compactMap { response -> DataListResponse<Artwork>? in
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try? decoder.decode(DataListResponse<Artwork>.self, from: response.data)
            }
            .map { $0 }
            .eraseToAnyPublisher()
    }
}
