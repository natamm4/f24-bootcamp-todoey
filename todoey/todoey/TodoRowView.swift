//
//  TodoRowView.swift
//  todoey
//
//  Created by Natalie Ammerman on 10/8/24.
//

import SwiftUI

struct TodoRowView: View {
    @Binding var todo: Todo
    
    var body: some View {
        HStack {
            Button {
                todo.isDone.toggle()
            } label: {
                Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
            }
            TextField("\(todo.text)", text: $todo.text)
            }
        .navigationTitle("Todoey")
        }
}


#Preview {
    @Previewable @State var todo = Todo(isDone: false, text: "do dishes")
    TodoRowView(todo: $todo)
}
