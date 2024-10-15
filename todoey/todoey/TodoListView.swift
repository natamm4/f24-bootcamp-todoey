//
//  TodoListView.swift
//  todoey
//
//  Created by Natalie Ammerman on 10/8/24.
//

import SwiftUI

struct TodoListView: View {
    @State private var todoList = TodoItems()
    @State private var newTodo: String = ""
    
    //var todoItems: TodoItems
    
    var body: some View {
        NavigationStack {
            List {
                //Section("Edit") {
                //TextField("Enter todo", text: $newTodo).onSubmit {
                //todoList.items.append(Todo(text: newTodo))
                //}
                //}
                Section() {
                    ForEach($todoList.items) {
                        $todo in TodoRowView(todo: $todo)
                    }
                    .onDelete(perform: removeItems)
                }
            }
            Button(action: {
                //TextField("", text: $newTodo)
                todoList.items.append(Todo(text: ""))
            }) {
                Image(systemName: "plus.circle.fill")
                Text("Todo")
            }
            .navigationTitle("Todoey")
        }
    }
    func removeItems(at offsets: IndexSet) {
        todoList.items.remove(atOffsets: offsets)
    }
}

#Preview {
    TodoListView()
}
