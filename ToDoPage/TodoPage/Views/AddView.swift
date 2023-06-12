//
//  AddView.swift
//  ToDoPage
//
//  Created by Егор  on 06.06.2022.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var vm: TodoPageViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var newTitle: String = ""
    var body: some View {
        ScrollView{
            newTaskTitle
        }
        .navigationTitle("Add an Task")
        .overlay(alignment: .bottom) {
            saveButton
        }
    }
}

extension AddView{
    private var newTaskTitle: some View{
        VStack(alignment: .leading, spacing: 10){
            Text("TASK TITLE")
                .frame(alignment: .leading)
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
        TextField("", text: $newTitle)
            .padding(.horizontal)
            .frame(height: 50)
            .background(Color.theme.background)
            .cornerRadius(10)
        }.padding(.horizontal)
    }
    private var saveButton: some View{
        Button {
            saveButtonPresed()
        } label: {
            Text("SAVE")
                .frame(maxWidth: .infinity)
                .font(.headline)
                .padding()
                .foregroundColor(Color.theme.background)
                .background(Rectangle().foregroundColor(Color.theme.purple).cornerRadius(10))
                .padding()
        }
    }
    private func saveButtonPresed(){
        vm.addItems(title: newTitle)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
                .preferredColorScheme(.dark)
        }.environmentObject(TodoPageViewModel())
    }
}
