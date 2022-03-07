//
//  ApiServiceType.swift
//  Artwork
//
//  Created by Jacob on 2/23/22.
//

import Combine
import Moya

protocol ApiServiceType {
    func getArtworks(page: Int) -> AnyPublisher<DataListResponse<Artwork>, MoyaError>
}
