//
//  composable_architectureTests.swift
//  composable-architectureTests
//
//  Created by 신동규 on 2022/03/13.
//

import XCTest
import ComposableArchitecture
@testable import composable_architecture

class composable_architectureTests: XCTestCase {
    
    let scheduler = DispatchQueue.test

    func testCountDown() {
        let testStore = TestStore(initialState: CounterState(), reducer: counterReducer, environment: CounterEnvironment(funFactClient: FunFactClient.failing, mainQueue: scheduler.eraseToAnyScheduler()))
        
        testStore.send(.incrementButtonTapped) {
            $0.count = 1
        }
        
        testStore.send(.decrementButtonTapped) {
            $0.count = 0
        }
    }
    
    func testFunFactButtonTapped() {
        let testStore = TestStore(initialState: CounterState(), reducer: counterReducer, environment: CounterEnvironment(funFactClient: FunFactClient.failing, mainQueue: scheduler.eraseToAnyScheduler()))
        
        testStore.environment.funFactClient.funcFact = { _ in Effect(value: "1 is one")  }
        
        testStore.send(.funcFactButtonTapped) {
            $0.isLoading = true
        }
        self.scheduler.advance()
        testStore.receive(.funcFactReponse(.success("1 is one"))) {
            $0.funcFactMessage = "1 is one"
            $0.isLoading = false
        }
    }
}
