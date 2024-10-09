//
//  TodoListView.swift
//  todoey
//
//  Created by Natalie Ammerman on 10/8/24.
//

import SwiftUI

struct TodoListView: View {
    @State private var todoList = Todo.exampleList
    @State private var newTodo: String = ""
    var body: some View {
        NavigationStack {
            List {
                Section("Edit") {
                    TextField("Enter todo", text: $newTodo).onSubmit {
                        todoList.append(Todo(text: newTodo))
                    }
                }
                Section("Todos") {
                    ForEach($todoList) {
                        $todo in TodoRowView(todo: $todo)
                    }
                }
            }
            .navigationTitle("Todoey")
        }
    }
}

#Preview {
    TodoListView()
}
