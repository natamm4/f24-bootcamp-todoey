//
//  TodoModel.swift
//  todoey
//
//  Created by Natalie Ammerman on 10/8/24.
//

import SwiftUI

struct Todo: Identifiable, Codable {
    var id = UUID()
    var isDone = false
    var text: String
}

extension Todo {
    static var example: Todo {
        Todo(text: "Buy beans")
    }
    static var exampleList: [Todo] {
            [Todo(text: "Walk on your hands"), Todo(text: "Feed the hog"), Todo(isDone: true, text: "Fire your boss")]
        }
}

@Observable
class TodoItems {
    var items = [Todo]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Todo].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
