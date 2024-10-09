//
//  TodoModel.swift
//  todoey
//
//  Created by Natalie Ammerman on 10/8/24.
//

import SwiftUI

struct Todo: Identifiable {
    let id = UUID()
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
