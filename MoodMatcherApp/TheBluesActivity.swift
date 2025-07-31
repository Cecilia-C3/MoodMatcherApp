//
//  SadActivity.swift
//  MoodMatcher

import SwiftData
import SwiftUI

@Model
class SadActivity {
    var sadName: String
    var sadDescription: String
    
    init(sadName: String, sadDescription: String) {
        self.sadName = sadName
        self.sadDescription = sadDescription
    }
}

struct SadActivityListView: View {
    @Query private var sadActivities: [SadActivity]
    @Environment(\.modelContext) private var modelContext
    
    @State private var addSadActivity = false
    @State private var editSadActivity: SadActivity?
    
    let setSadActivities = [
        SadActivity(sadName: "Let it all out", sadDescription: "Journal, draw, or paint your feelings——no filter 🎨"),
        SadActivity(sadName: "Engage with old favorites", sadDescription: "Watch your comfort show or movie 🍿"),
        SadActivity(sadName: "Rearrange your room", sadDescription: "Bring new & fresh energy into your life 💫")
    ]
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(hue: 0.626, saturation: 0.391, brightness: 0.785)
                    .ignoresSafeArea()
                List {
                    Section{
                        Text("Set Activities")
                            .font(.headline)
                    }
                    ForEach(setSadActivities) {activity in
                        HStack{
                            Text (activity.sadName)
                                .font(.headline)
                            Text (activity.sadDescription)
                        }}
                    
                    Section{
                        Text("Your Activities")
                            .font(.headline)
                    }
                    ForEach(sadActivities) {activity in
                        HStack {
                            Text (activity.sadName)
                                .font(.headline)
                            Text (activity.sadDescription)
                        }
                        .onTapGesture {
                            editSadActivity = activity
                        }
                    }
                    .onDelete(perform: deleteSadActivity)
                }
                .background(Color.clear)
                .scrollContentBackground(.hidden)
                
                .navigationTitle("The Blues: Activities")
                .padding(1)
                .navigationBarItems(trailing: Button(action: {
                    addSadActivity = true
                }) { Image(systemName: "plus")
                        .font(.system(size: 18, weight: .bold))
                        .padding(12)
                        .background(Circle().fill(Color.white))
                        .foregroundColor(Color(hue: 0.626, saturation: 0.391, brightness: 0.785))
                        .shadow(radius: 3)
                })
                .sheet(item: $editSadActivity) { activity in
                    EditSadActivityView(sadActivity: activity)
                }
                .sheet(isPresented: $addSadActivity) {
                    AddSadActivityView()
                }
            }
        }
    }
    
    func deleteSadActivity(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(sadActivities[index])
        }
    }
}


struct AddSadActivityView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var sadName = ""
    @State private var sadDescription = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Activity Name", text: $sadName)
                TextField("Description", text: $sadDescription)
            }
            .navigationTitle("Add Activity")
            .navigationBarItems(trailing: Button("Save") {
                let newActivity = SadActivity(sadName: sadName, sadDescription: sadDescription)
                modelContext.insert(newActivity)
                dismiss()
            }.disabled(sadName.isEmpty || sadDescription.isEmpty))
        }
    }
}

struct EditSadActivityView: View {
    @Environment(\.dismiss) var dismiss

    @Bindable var sadActivity: SadActivity

    var body: some View {
        NavigationView {
            Form {
                TextField("Activity Name", text: $sadActivity.sadName)
                TextField("Description", text: $sadActivity.sadDescription)
            }
            .navigationTitle("Edit Activity")
            .navigationBarItems(trailing: Button("Save") {
                dismiss()
            }.disabled(sadActivity.sadName.isEmpty || sadActivity.sadDescription.isEmpty))
        }
    }
}

struct SadActivities: App {
    var body: some Scene {
        WindowGroup {
            SadActivityListView()
        }
        .modelContainer(for: SadActivity.self)
    }
}

#Preview {
    SadActivityListView()
        .modelContainer(for: SadActivity.self, inMemory: true)
}



