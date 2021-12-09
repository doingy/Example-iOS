//
//  FuncTodoTableViewController.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/12/9.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

class FuncTableViewControllerDataSource: NSObject, UITableViewDataSource {
    
    enum Section: Int {
    case input = 0, todos, max
    }
    
    var todos: [String]
    weak var owner: FuncTodoTableViewController?
    
    init(todos: [String], owner: FuncTodoTableViewController?) {
        self.todos = todos
        self.owner = owner
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.max.rawValue
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {
            fatalError()
        }
        switch section {
        case .input: return 1
        case .todos: return todos.count
        case .max: fatalError()
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError()
        }
        
        switch section {
        case .input:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewInputCell", for: indexPath) as! TableViewInputCell
            cell.delegate = owner
            
            return cell
        case .todos:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

            cell.textLabel?.text = todos[indexPath.row]

            return cell
        default:
            fatalError()
        }
        
    }
}

class FuncTodoTableViewController: UITableViewController {
    struct State: StateType {
        var dataSource = FuncTableViewControllerDataSource(todos: [], owner: nil)
        var text: String = ""
    }
    
    enum Action: ActionType {
        case updateText(text: String)
        case addTodos(items: [String])
        case remoteTodo(index: Int)
        case loadTodos
    }
    
    enum Command: CommandType {
        case loadTodos(completion: ([String]) -> Void)
    }
    
    lazy var reducer: (State, Action) -> (state: State, command: Command?) = { [weak self] (state, action) in
        
        var state = state
        var command: Command? = nil
        
        switch action {
        case .updateText(let text):
            state.text = text
        
        case .addTodos(let items):
            state.dataSource = FuncTableViewControllerDataSource(todos: items + state.dataSource.todos, owner: state.dataSource.owner)
            
        case .remoteTodo(let index):
            let oldTodos = state.dataSource.todos
            state.dataSource = FuncTableViewControllerDataSource(todos: Array(oldTodos[..<index] + oldTodos[(index+1)...]), owner: state.dataSource.owner)
            
        case .loadTodos:
            command = Command.loadTodos(completion: { data in
                self?.store.dispatch(.addTodos(items: data))
            })
        }
        
        return (state, command)
    }
    
    var store: Store<Action, State, Command>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        
        let dataSource = FuncTableViewControllerDataSource(todos: [], owner: self)
        store = Store<Action, State, Command>(reducer: reducer, initial: State(dataSource: dataSource, text: ""))
        
        store.subscribe { [weak self] (state, previousState, command) in
            self?.stateDidChanged(state: state, previousState: previousState, command: command)
        }

        stateDidChanged(state: store.state, previousState: nil, command: nil)
        
        store.dispatch(.loadTodos)
    }
    
    @objc func addAction() {
        store.dispatch(.addTodos(items: [store.state.text]))
        store.dispatch(.updateText(text: ""))
    }
    
    func stateDidChanged(state: State, previousState: State?, command: Command?) {
        if let command = command {
            switch command {
            case .loadTodos(let handler):
                TodoStore.shared.getTodoItems(completionHandler: handler)
            }
        }
        
        if previousState == nil || previousState!.dataSource.todos != state.dataSource.todos {
            let dataSource = state.dataSource
            tableView.dataSource = dataSource
            tableView.reloadData()
            title = "TODO - (\(dataSource.todos.count))"
        }
        
        if previousState == nil || previousState!.text != state.text {
            navigationItem.rightBarButtonItem?.isEnabled = state.text.count >= 3

            let cell = tableView.cellForRow(at: IndexPath(row: 0, section: FuncTableViewControllerDataSource.Section.input.rawValue)) as? TableViewInputCell
            cell?.textField.text = state.text
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard let section = FuncTableViewControllerDataSource.Section(rawValue: indexPath.section) else {
            return false
        }
        
        switch section {
        case .input: return false
        case .todos: return true
        default: return false
        }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            store.dispatch(.remoteTodo(index: indexPath.row))
        }
    }

}

extension FuncTodoTableViewController: TableViewInputCellDelegate {
    func inputChanged(cell: TableViewInputCell, text: String) {
        store.dispatch(.updateText(text: text))
    }
}
