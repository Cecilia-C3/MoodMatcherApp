//
//  Cloud9Activity.swift
//  MoodMatcher

import SwiftData
import SwiftUI

@Model
class HappyActivity {
    var happyName: String
    var happyDescription: String
    
    init(happyName: String, happyDescription: String) {
        self.happyName = happyName
        self.happyDescription = happyDescription
    }
}

struct HappyActivityListView: View {
    @Query private var happyActivities: [HappyActivity]
    @Environment(\.modelContext) private var modelContext
    
    @State private var addHappyActivity = false
    @State private var editHappyActivity: HappyActivity?
    
    let setHappyActivities = [
        HappyActivity(happyName: "x", happyDescription: "y"),
        HappyActivity(happyName: "x", happyDescription: "y"),
        HappyActivity(happyName: "x", happyDescription: "y")
    ]
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 0.9176470588235294, green: 0.47058823529411764, blue: 0.34509803921568627)
                    .ignoresSafeArea()
                List {
                    Section{
                        Text("Set Activities")
                            .font(.headline)
                    }
                    ForEach(setHappyActivities) {activity in
                        HStack{
                            Text (activity.happyName)
                                .font(.headline)
                            Text (activity.happyDescription)
                        }}
                    
                    Section{
                        Text("Your Activities")
                            .font(.headline)
                    }
                    ForEach(happyActivities) {activity in
                        HStack {
                            Text (activity.happyName)
                                .font(.headline)
                            Text (activity.happyDescription)
                        }
                        .onTapGesture {
                            editHappyActivity = activity
                        }
                    }
                    .onDelete(perform: deleteHappyActivity)
                }
                .background(Color.clear)
                .scrollContentBackground(.hidden)
                
                .navigationTitle("Cloud 9: Activities")
                .padding(1)
                .navigationBarItems(trailing: Button(action: {
                    addHappyActivity = true
                }) { Image(systemName: "plus")
                })
                .sheet(item: $editHappyActivity) { activity in
                    EditHappyActivityView(happyActivity: activity)
                }
                .sheet(isPresented: $addHappyActivity) {
                    AddHappyActivityView()
                }
            }
        }
    }
    
    func deleteHappyActivity(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(happyActivities[index])
        }
    }
}


struct AddHappyActivityView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var happyName = ""
    @State private var happyDescription = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Activity Name", text: $happyName)
                TextField("Description", text: $happyDescription)
            }
            .navigationTitle("Add Activity")
            .navigationBarItems(trailing: Button("Save") {
                let newActivity = HappyActivity(happyName: happyName, happyDescription: happyDescription)
                modelContext.insert(newActivity)
                dismiss()
            }.disabled(happyName.isEmpty || happyDescription.isEmpty))
        }
    }
}

struct EditHappyActivityView: View {
    @Environment(\.dismiss) var dismiss

    @Bindable var happyActivity: HappyActivity
    var body: some View {
        NavigationView {
            Form {
                TextField("Activity Name", text: $happyActivity.happyName)
                TextField("Description", text: $happyActivity.happyDescription)
            }
            .navigationTitle("Edit Activity")
            .navigationBarItems(trailing: Button("Save") {
                dismiss()
            }.disabled(happyActivity.happyName.isEmpty || happyActivity.happyDescription.isEmpty))
        }
    }
}

struct HappyActivities: App {
    var body: some Scene {
        WindowGroup {
            HappyActivityListView()
        }
        .modelContainer(for: HappyActivity.self)
    }
}

#Preview {
    HappyActivityListView()
        .modelContainer(for: HappyActivity.self, inMemory: true)
}


