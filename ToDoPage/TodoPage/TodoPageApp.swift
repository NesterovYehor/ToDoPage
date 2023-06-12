//
//  TodoPageApp.swift
//  ToDoPage
//
//  Created by Егор  on 05.06.2022.
//

import SwiftUI

@main
struct TodoPageApp: App {
    @StateObject var vm: TodoPageViewModel = TodoPageViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                TodoPageView()
            }.environmentObject(vm)
        }
    }
}
