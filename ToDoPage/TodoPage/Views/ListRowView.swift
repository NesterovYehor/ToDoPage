//
//  ListRowView.swift
//  ToDoPage
//
//  Created by Егор  on 05.06.2022.
//

import SwiftUI

struct ListRowView: View {
    
    let item: Task
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.theme.green : Color.theme.red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = Task(title: "First task", isCompleted: false)
    static var item2 = Task(title: "Second task", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
