//
//  ContentView.swift
//  bonus_lab
//
//  Created by davis street on 3/28/22.
//

import SwiftUI
import Combine

struct ContentView: View
{
    @ObservedObject var sTask = storeTask()
    @State var newTask : String = ""
    @State private var showEdit = false
    @State private var showDelete = false
    var searchBar : some View
    {
        HStack
        {
            TextField("enter a task", text: self.$newTask)
            Button(action: self.addNewTask, label: {Text("add new")})
        }
    }
    
    func addNewTask()
    {
        
        sTask.tasks.append(Task(id: String(sTask.tasks.count + 1), taskItem: newTask))
        self.newTask = ""
    }
    struct dTask: Equatable
    {
        var i: Int
    }
    
    var body: some View
    
    {
        NavigationView
        {
            VStack
            {
                searchBar.padding()
                List
                {
                    ForEach(self.sTask.tasks)
                    {
                        task in
                        var i: String = task.taskItem
                        Button(task.taskItem)
                        {
                            print("interacted")
                            showEdit = true
                        }.alert("edit task?", isPresented: $showEdit) {
                            
                            Button("Done", role: .cancel) { }
                        }
                        Button("Delete Task?")
                        {
                            print("interacted")
                            showDelete = true
                        }.alert("Task Deleted", isPresented: $showDelete) {
                            
                            Button("Done", role: .cancel)
                            {
                                let r = sTask.tasks.firstIndex(of: i)
                                sTask.tasks.remove(at: r)
                            }
                        }
                    }
                }.navigationTitle("To-Do List")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        
        ContentView()
    }
}
