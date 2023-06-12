//
//  Task.swift
//  ToDoPage
//
//  Created by Егор  on 08.06.2022.
//

import Foundation

struct Task: Codable, Identifiable{
    var id: String = UUID().uuidString
    var title: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> Task{
        return Task(id: id, title: title, isCompleted: !isCompleted)
    }
}
