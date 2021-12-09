//
//  FuncTodoTableViewController.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/12/9.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

class FuncTodoTableViewController: UITableViewController {
    
    enum Section: Int {
    case input = 0, todos, max
    }
    
    var todos: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))

        TodoStore.shared.getTodoItems { data in
            self.todos += data
            self.title = "TODO - \(self.todos.count)"
            self.tableView.reloadData()
        }
    }
    
    @objc func addAction() {
        guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: Section.input.rawValue)) as? TableViewInputCell, let text = cell.textField.text else {
            return
        }
        
        todos.insert(text, at: 0)
        cell.textField.text = ""
        title = "TODO - \(todos.count)"
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.max.rawValue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {
            fatalError()
        }
        switch section {
        case .input: return 1
        case .todos: return todos.count
        case .max: fatalError()
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError()
        }
        
        switch section {
        case .input:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewInputCell", for: indexPath) as! TableViewInputCell
            cell.delegate = self
            
            return cell
        case .todos:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

            cell.textLabel?.text = self.todos[indexPath.row]

            return cell
        default:
            fatalError()
        }
        
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard let section = Section(rawValue: indexPath.section) else {
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
            self.todos.remove(at: indexPath.row)
            title = "TODO - \(todos.count)"
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}

extension FuncTodoTableViewController: TableViewInputCellDelegate {
    func inputChanged(cell: TableViewInputCell, text: String) {
        navigationItem.rightBarButtonItem?.isEnabled = text.count >= 3
    }
}
