//
//  NoTasksView.swift
//  ToDoPage
//
//  Created by Егор  on 08.06.2022.
//

import SwiftUI

struct NoTasksView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something")
                        .font(.headline)
                        .foregroundColor(Color.theme.background)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.theme.red : Color.theme.purple)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? Color.theme.red.opacity(0.7) : Color.theme.purple.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension NoTasksView{
    private func addAnimation(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 2.0).repeatForever(), {
                animate.toggle()
                    
            })
        }
    }
}

struct NoTasksView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoTasksView()
                
        }.navigationTitle("Title")
    }
}
