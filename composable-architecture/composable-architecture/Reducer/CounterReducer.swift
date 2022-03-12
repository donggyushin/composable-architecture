//
//  CounterReducer.swift
//  composable-architecture
//
//  Created by 신동규 on 2022/03/13.
//

import Combine
import ComposableArchitecture
import Foundation

struct CounterState: Equatable {
    var count = 0
    var funcFactMessage: String?
    var isLoading = false
}

enum CounterAction: Equatable {
    case decrementButtonTapped
    case incrementButtonTapped
    case funcFactReponse(Result<String, FunFactClient.Failure>)
    case funcFactButtonTapped
}

struct CounterEnvironment {
    var funFactClient: FunFactClient
    var mainQueue: AnySchedulerOf<DispatchQueue>
}

let counterReducer = Reducer<CounterState, CounterAction, CounterEnvironment> { state, action, env in
    switch action {
    case .decrementButtonTapped:
        state.count -= 1
        return .none
    case .incrementButtonTapped:
        state.count += 1
        return .none
    case .funcFactReponse(.failure(let error)):
        state.funcFactMessage = error.message
        state.isLoading = false
        return .none
    case .funcFactReponse(.success(let message)):
        state.funcFactMessage = message
        state.isLoading = false
        return .none
    case .funcFactButtonTapped:
        
        struct Number: Hashable {}
        state.isLoading = true
        return env.funFactClient
            .funcFact(state.count)
            .receive(on: env.mainQueue)
            .catchToEffect(CounterAction.funcFactReponse)
            .cancellable(id: Number(), cancelInFlight: true)
    }
}
