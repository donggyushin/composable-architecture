//
//  FunFactClient.swift
//  composable-architecture
//
//  Created by 신동규 on 2022/03/13.
//

import ComposableArchitecture
import Foundation

struct FunFactClient {
    var funcFact: (_ number: Int) -> Effect<String, Failure>
    
    struct Failure: Error, Equatable {
        let message: String
    }
}

extension FunFactClient {
    static let live = FunFactClient { number in
        let url = URL(string: "http://numbersapi.com/\(number)/math")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { data, _ in String(decoding: data, as: UTF8.self)}
            .mapError({ error in Failure(message: error.localizedDescription)})
            .eraseToEffect()
    }
}
