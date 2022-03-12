//
//  CounterReducer.swift
//  composable-architecture
//
//  Created by 신동규 on 2022/03/13.
//

import Combine
import ComposableArchitecture

struct CounterState: Equatable {
    var count = 0
    var funcFactMessage: String?
}

enum CounterAction: Equatable {
    case decrementButtonTapped
    case incrementButtonTapped
}

struct CounterEnvironment {}

let counterReducer = Reducer<CounterState, CounterAction, CounterEnvironment> { state, action, _ in
    switch action {
    case .decrementButtonTapped:
        state.count -= 1
        return .none
    case .incrementButtonTapped:
        state.count += 1
        return .none
    }
}
