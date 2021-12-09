//
//  FuncTodoTableViewControllerTests.swift
//  ExampleSwiftTests
//
//  Created by 杨冬青 on 2021/12/9.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import XCTest

@testable import ExampleSwift

class FuncTodoTableViewControllerTests: XCTestCase {
    
    var controller: FuncTodoTableViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FuncTodoTableViewController") as? FuncTodoTableViewController else {
            fatalError()
        }
        controller.viewDidLoad()
        self.controller = controller
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUpdateView() {
        let state1 = FuncTodoTableViewController.State(
            dataSource:FuncTableViewControllerDataSource(todos: [], owner: nil),
            text: ""
        )
        // 从 nil 状态转换为 state1
        controller.stateDidChanged(state: state1, previousState: nil, command: nil)
        XCTAssertEqual(controller.title, "TODO - (0)")
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: FuncTableViewControllerDataSource.Section.todos.rawValue), 0)
        XCTAssertFalse(controller.navigationItem.rightBarButtonItem!.isEnabled)
            
        let state2 = FuncTodoTableViewController.State(
            dataSource:FuncTableViewControllerDataSource(todos: ["1", "3"], owner: nil),
            text: "Hello"
        )
        // 从 state1 状态转换为 state2
        controller.stateDidChanged(state: state2, previousState: state1, command: nil)
        XCTAssertEqual(controller.title, "TODO - (2)")
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: FuncTableViewControllerDataSource.Section.todos.rawValue), 2)
        XCTAssertEqual(controller.tableView.cellForRow(at: IndexPath(row: 1, section: FuncTableViewControllerDataSource.Section.todos.rawValue))?.textLabel?.text, "3")
        XCTAssertTrue(controller.navigationItem.rightBarButtonItem!.isEnabled)
    }
    
    func testReducerUpdateTextFromEmpty() {
        let initState = FuncTodoTableViewController.State()
        let state = controller.reducer(initState, .updateText(text: "123")).state
        XCTAssertEqual(state.text, "123")
    }
    
    func testLoadToDos() {
        let initState = FuncTodoTableViewController.State()
        let (_, command) = controller.reducer(initState, .loadTodos)
        XCTAssertNotNil(command)
        switch command! {
        case .loadTodos(let handler):
            handler(["2", "3"])
            XCTAssertEqual(controller.store.state.dataSource.todos, ["2", "3"])
        // 现在 Command 只有 .loadToDos 一个命令。如果存在多个 Command，可以去下面的注释，
        // 这样在命令不符时可以让测试失败
        // default:
        //     XCTFail("The command should be .loadToDos")
        }
    }
    
    /*
    // 初始状态
    func testSettingState() {
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: FuncTableViewControllerDataSource.Section.todos.rawValue), 0)
        XCTAssertEqual(controller.title, "TODO - (0)")
        XCTAssertFalse(controller.navigationItem.rightBarButtonItem!.isEnabled)

        // ([], "") -> (["1", "2", "3"], "abc")
        controller.state = FuncTodoTableViewController.State(todos: ["1", "2", "3"], text: "abc")
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: FuncTableViewControllerDataSource.Section.todos.rawValue), 3)
        XCTAssertEqual(controller.tableView.cellForRow(at: IndexPath(row: 1, section: FuncTableViewControllerDataSource.Section.todos.rawValue))?.textLabel?.text, "2")
        XCTAssertEqual(controller.title, "TODO - (3)")
        XCTAssertTrue(controller.navigationItem.rightBarButtonItem!.isEnabled)

        // (["1", "2", "3"], "abc") -> ([], "")
        controller.state = FuncTodoTableViewController.State(todos: [], text: "")
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: FuncTableViewControllerDataSource.Section.todos.rawValue), 0)
        XCTAssertEqual(controller.title, "TODO - (0)")
        XCTAssertFalse(controller.navigationItem.rightBarButtonItem!.isEnabled)
    }
    
    func testAdding() {
        let testItem = "Test Item"

        let originalTodos = controller.state.todos
        controller.state = FuncTodoTableViewController.State(todos: originalTodos, text: testItem)
        controller.addAction()
        XCTAssertEqual(controller.state.todos, [testItem] + originalTodos)
        XCTAssertEqual(controller.state.text, "")
    }
        
    func testRemoving() {
        controller.state = FuncTodoTableViewController.State(todos: ["1", "2", "3"], text: "")
        controller.tableView(controller.tableView, commit: .delete, forRowAt: IndexPath(row: 1, section: FuncTodoTableViewController.Section.todos.rawValue))
        XCTAssertEqual(controller.state.todos, ["1", "3"])
    }
        
    func testInputChanged() {
        controller.inputChanged(cell: TableViewInputCell(), text: "Hello")
        XCTAssertEqual(controller.state.text, "Hello")
    }
     */

}
