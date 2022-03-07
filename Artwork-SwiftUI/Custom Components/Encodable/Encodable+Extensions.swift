//
//  Encodable+Extensions.swift
//  Artwork-SwiftUI
//
//  Created by Jacob on 3/3/22.
//

import Foundation

extension Encodable {
    func encode<T: Codable>(type: T) -> Data {
        do { return try JSONEncoder().encode(type.self) }
        catch { fatalError("Error: Unable to encode, \(error.localizedDescription)") }
    }

    var encodedData: Data {
        let type = self
        do { return try JSONEncoder().encode(type.self) }
        catch { fatalError("Error: Unable to encode, \(error.localizedDescription)") }
    }

    func convertToSnakeCase() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        do {
            let data = try encoder.encode(self)
            dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                as? [String: Any] ?? [:]
        } catch _ {}
        return dictionary
    }
}
