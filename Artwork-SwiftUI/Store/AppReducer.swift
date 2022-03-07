//
//  AppReducer.swift
//  Artwork-SwiftUI
//
//  Created by Jacob on 2/27/22.
//

import Foundation
import Combine

enum AppReducer {
    static func appReducer(
        state: inout AppState,
        action: AppAction,
        environment: World
    ) -> AnyPublisher<AppAction, Never> {
        switch action {
            case let .artworkListView(action: action):
                return artworkListReducer(
                    state: &state.artworkListState,
                    action: action,
                    environment: environment
                )
                .map(AppAction.artworkListView)
                .eraseToAnyPublisher()
        }
    }
}

