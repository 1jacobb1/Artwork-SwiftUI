////
////  ArtworkListStateTests.swift
////  Artwork-SwiftUITests
////
////  Created by Jacob on 3/3/22.
////
//
//@testable import Artwork_SwiftUI
//import XCTest
//import Moya
//
//class ArtworkListStateTests: XCTestCase {
//
//    var store: AppStore!
//
//    override func setUp() {
//        super.setUp()
//        store = AppStore(initialState: .init(),
//                         reducer: AppReducer.appReducer,
//                         environment: World())
//    }
//
//    override func tearDown() {
//        store = nil
//        super.tearDown()
//    }
//
//    func testSuccessfulFetchArtworksRefreshList() {
//        let world = World(apiService: MockApiService(
//            getArtworksResponse: DataListResponse(pagination: Pagination(totalPages: 2, currentPage: 1),
//                                                  data: [.sample])
//        ))
////        store = AppStore(initialState: .init(),
////                         reducer: AppReducer.appReducer,
////                         environment: world)
////        store.send(.artworkListView(action: .refreshList))
//
////        let expect = expectation(description: "Pull artworks in page 1.")
////        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
////            expect.fulfill()
////        }
////        wait(for: [expect], timeout: 2)
//
////        XCTAssert(!store.state.artworkListState.artworks.isEmpty)
//        var state = ArtworkListState()
////
////        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.5) {
////            _ = artworkListReducer(state: &state, action: .refreshList, environment: world)
////            XCTAssert(!state.isRequesting)
////            XCTAssert(!state.artworks.isEmpty)
////        }
//
//        _ = artworkListReducer(state: &state, action: .refreshList, environment: world)
//        XCTAssert(!state.isRequesting)
//        XCTAssert(!state.artworks.isEmpty)
//    }
//
////    func testSuccessfulFetchArtworksLoadMore() {
////        let world = World(apiService: MockApiService(
////            getArtworkError: MoyaError.statusCode(Response(statusCode: 400, data: Data()))
////        ))
////        store.mockConfigureEnvironment(world)
////        store = AppStore(initialState: .init(),
////                         reducer: AppReducer.appReducer,
////                         environment: world)
////
////        store.send(.artworkListView(action: .loadMore))
////        XCTAssert(!store.state.artworkListState.artworks.isEmpty)
////    }
//}
