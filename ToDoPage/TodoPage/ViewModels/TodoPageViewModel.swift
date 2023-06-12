//
//  TodoPageViewModel.swift
//  ToDoPage
//
//  Created by Егор  on 08.06.2022.
//

import Foundation

class TodoPageViewModel: ObservableObject {
    @Published var tasks: [Task] = [] {
        didSet{
            saveTasks()
        }
    }
    let taskKey: String = "task_list"
    
    func getTasks(){
        guard
            let data = UserDefaults.standard.data(forKey: taskKey),
            let savedTasks = try? JSONDecoder().decode([Task].self, from: data)
        else{return}
        
        self.tasks = savedTasks
    }
    func saveTasks(){
        if let encodedData = try? JSONEncoder().encode(tasks){
            UserDefaults.standard.set(encodedData, forKey: taskKey)
        }
    }
    func delateTask(indexSet: IndexSet){
        tasks.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        tasks.move(fromOffsets: from, toOffset: to)
    }
    func addItems(title: String){
        let newTask = Task(title: title, isCompleted: false)
        tasks.append(newTask)
    }
    func updateTask(task: Task){
        if let index = tasks.firstIndex(where: {$0.id == task.id}){
            tasks[index] = task.updateCompletion()
        }
    }
}
