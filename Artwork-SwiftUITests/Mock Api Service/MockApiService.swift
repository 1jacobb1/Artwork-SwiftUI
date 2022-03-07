////
////  MockApiService.swift
////  Artwork-SwiftUITests
////
////  Created by Jacob on 3/4/22.
////
//
//import Combine
//import XCTest
//import Moya
//@testable import Artwork_SwiftUI
//
//struct MockApiService: ApiServiceType {
//
//    // Sample moya error
//    // MoyaError.statusCode(Response(statusCode: 400, data: Data()))
//
//    internal let getArtworksResponse: DataListResponse<Artwork>?
//    internal let getArtworkError: MoyaError?
//
//    init(
//        getArtworksResponse: DataListResponse<Artwork>? = nil,
//        getArtworkError: MoyaError? = nil
//    ) {
//        self.getArtworksResponse = getArtworksResponse
//        self.getArtworkError = getArtworkError
//    }
//
//    func getArtworks(page: Int) -> AnyPublisher<DataListResponse<Artwork>, MoyaError> {
////        if let getArtworkError = getArtworkError {
////            // To return failing response, use this.
////            return Result<DataListResponse<Artwork>, MoyaError>
////                .failure(getArtworkError)
////                .publisher
////                .eraseToAnyPublisher()
////        } else if let getArtworksResponse = getArtworksResponse {
////            return Result<DataListResponse<Artwork>, MoyaError>
////                .success(getArtworksResponse)
////                .publisher
////                .eraseToAnyPublisher()
////        }
////
////        // To return success, use this
////        return Result<DataListResponse<Artwork>, MoyaError>
////            .success(DataListResponse(data: [Artwork.sample]))
////            .publisher
////            .eraseToAnyPublisher()
//        let publisher = PassthroughSubject<DataListResponse<Artwork>, MoyaError>()
//        if let getArtworkError = getArtworkError {
//            publisher.send(completion: .failure(getArtworkError))
//        } else if let getArtworksResponse = getArtworksResponse {
//            publisher.send(getArtworksResponse)
//        }
//        publisher.send(completion: .finished)
//        return publisher.eraseToAnyPublisher()
//    }
//}
