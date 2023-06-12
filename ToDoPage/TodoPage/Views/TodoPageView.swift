//
//  TodoPageView.swift
//  ToDoPage
//
//  Created by Егор  on 05.06.2022.
//

import SwiftUI

struct TodoPageView: View {
    
    @EnvironmentObject var vm: TodoPageViewModel
    
    var body: some View {
        ZStack {
            if vm.tasks.isEmpty {
                NoTasksView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(vm.tasks) { task in
                        ListRowView(item: task)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    vm.updateTask(task: task)
                                }
                            }
                    }
                    .onDelete(perform: vm.delateTask)
                    .onMove(perform: vm.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List ")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
            )
    }

}

struct TodoPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodoPageView()
        }
        .environmentObject(TodoPageViewModel())
    }
}
