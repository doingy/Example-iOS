//
//  React.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/12/9.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import Foundation

protocol ActionType {}
protocol StateType {}
protocol CommandType {}

class Store<Action: ActionType, State: StateType, Command: CommandType> {
    let reducer: (_ state: State, _ action: Action) -> (State, Command?)
    var subscriber: ((_ state: State, _ previousState: State, _ command: Command?) -> Void)?
    var state: State
    
    init(reducer: @escaping (State, Action) -> (State, Command?), initial state: State) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(_ action: Action) {
        let previousState = state
        let (nextState, command) = reducer(state, action)
        state = nextState
        subscriber?(state, previousState, command)
    }
    
    func subscribe(_ handler: @escaping (State, State, Command?) -> Void) {
        self.subscriber = handler
    }
    
    func unsubscribe() {
        self.subscriber = nil
    }
}
