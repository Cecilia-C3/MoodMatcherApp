//
//  BrainFogActivity.swift
//  MoodMatcher

import SwiftData
import SwiftUI

@Model
class BoredActivity {
    var boredName: String
    var boredDescription: String
    
    init(boredName: String, boredDescription: String) {
        self.boredName = boredName
        self.boredDescription = boredDescription
    }
}

struct BoredActivityListView: View {
    @Query private var boredActivities: [BoredActivity]
    @Environment(\.modelContext) private var modelContext
    
    @State private var addBoredActivity = false
    @State private var editBoredActivity: BoredActivity?
    
    let setBoredActivities = [
        BoredActivity(boredName: "Meditation & Yoga", boredDescription: "Release all your energy 🤩"),
        BoredActivity(boredName: "Get lost in a new book!", boredDescription: "Or, a new show, recipe, or something else 🧑‍🍳"),
        BoredActivity(boredName: "Connect with your loved ones", boredDescription: "Start a conversation or plan a meet-up 💜")
    ]
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 0.9294117647058824, green: 0.7450980392156863, blue: 0.8941176470588236)
                    .ignoresSafeArea()
                List {
                    Section{
                        Text("Set Activities")
                            .font(.headline)
                    }
                    ForEach(setBoredActivities) {activity in
                        HStack{
                            Text (activity.boredName)
                                .font(.headline)
                            Text (activity.boredDescription)
                        }}
                    
                    Section{
                        Text("Your Activities")
                            .font(.headline)
                    }
                    ForEach(boredActivities) {activity in
                        HStack {
                            Text (activity.boredName)
                                .font(.headline)
                            Text (activity.boredDescription)
                        }
                        .onTapGesture {
                            editBoredActivity = activity
                        }
                    }
                    .onDelete(perform: deleteBoredActivity)
                }
                .background(Color.clear)
                .scrollContentBackground(.hidden)
                
                .navigationTitle("Brain Fog: Activities")
                .padding(1)
                .navigationBarItems(trailing: Button(action: {
                    addBoredActivity = true
                }) { Image(systemName: "plus")
                })
                .sheet(item: $editBoredActivity) { activity in
                    EditBoredActivityView(boredActivity: activity)
                }
                .sheet(isPresented: $addBoredActivity) {
                    AddBoredActivityView()
                }
            }
        }
    }
    
    func deleteBoredActivity(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(boredActivities[index])
        }
    }
}


struct AddBoredActivityView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var boredName = ""
    @State private var boredDescription = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Activity Name", text: $boredName)
                TextField("Description", text: $boredDescription)
            }
            .navigationTitle("Add Activity")
            .navigationBarItems(trailing: Button("Save") {
                let newActivity = BoredActivity(boredName: boredName, boredDescription: boredDescription)
                modelContext.insert(newActivity)
                dismiss()
            }.disabled(boredName.isEmpty || boredDescription.isEmpty))
        }
    }
}

struct EditBoredActivityView: View {
    @Environment(\.dismiss) var dismiss

    @Bindable var boredActivity: BoredActivity

    var body: some View {
        NavigationView {
            Form {
                TextField("Activity Name", text: $boredActivity.boredName)
                TextField("Description", text: $boredActivity.boredDescription)
            }
            .navigationTitle("Edit Activity")
            .navigationBarItems(trailing: Button("Save") {
                dismiss()
            }.disabled(boredActivity.boredName.isEmpty || boredActivity.boredDescription.isEmpty))
        }
    }
}

struct BoredActivities: App {
    var body: some Scene {
        WindowGroup {
            BoredActivityListView()
        }
        .modelContainer(for: BoredActivity.self)
    }
}

#Preview {
    BoredActivityListView()
        .modelContainer(for: BoredActivity.self, inMemory: true)
}


