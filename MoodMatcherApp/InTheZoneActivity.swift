//
//  InTheZoneActivity.swift
//  MoodMatcher

import SwiftData
import SwiftUI

@Model
class ProductiveActivity {
    var productiveName: String
    var productiveDescription: String
    
    init(productiveName: String, productiveDescription: String) {
        self.productiveName = productiveName
        self.productiveDescription = productiveDescription
    }
}

struct ProductiveActivityListView: View {
    @Query private var productiveActivities: [ProductiveActivity]
    @Environment(\.modelContext) private var modelContext
    
    @State private var addProductiveActivity = false
    @State private var editProductiveActivity: ProductiveActivity?
    
    let setProductiveActivities = [
        ProductiveActivity(productiveName: "x", productiveDescription: "y"),
        ProductiveActivity(productiveName: "x", productiveDescription: "y"),
        ProductiveActivity(productiveName: "x", productiveDescription: "y")
    ]
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 0.6392156862745098, green: 0.7607843137254902, blue: 0.5137254901960784)
                    .ignoresSafeArea()
                List {
                    Section{
                        Text("Set Activities")
                            .font(.headline)
                    }
                    ForEach(setProductiveActivities) {activity in
                        HStack{
                            Text (activity.productiveName)
                                .font(.headline)
                            Text (activity.productiveDescription)
                        }}
                    
                    Section{
                        Text("Your Activities")
                            .font(.headline)
                    }
                    ForEach(productiveActivities) {activity in
                        HStack {
                            Text (activity.productiveName)
                                .font(.headline)
                            Text (activity.productiveDescription)
                        }
                        .onTapGesture {
                            editProductiveActivity = activity
                        }
                    }
                    .onDelete(perform: deleteProductiveActivity)
                }
                .background(Color.clear)
                .scrollContentBackground(.hidden)
                
                .navigationTitle("In the Zone: Activities")
                .padding(1)
                .navigationBarItems(trailing: Button(action: {
                    addProductiveActivity = true
                }) { Image(systemName: "plus")
                })
                .sheet(item: $editProductiveActivity) { activity in
                    EditProductiveActivityView(productiveActivity: activity)
                }
                .sheet(isPresented: $addProductiveActivity) {
                    AddProductiveActivityView()
                }
            }
        }
    }
    
    func deleteProductiveActivity(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(productiveActivities[index])
        }
    }
}


struct AddProductiveActivityView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var productiveName = ""
    @State private var productiveDescription = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Activity Name", text: $productiveName)
                TextField("Description", text: $productiveDescription)
            }
            .navigationTitle("Add Activity")
            .navigationBarItems(trailing: Button("Save") {
                let newActivity = ProductiveActivity(productiveName: productiveName, productiveDescription: productiveDescription)
                modelContext.insert(newActivity)
                dismiss()
            }.disabled(productiveName.isEmpty || productiveDescription.isEmpty))
        }
    }
}

struct EditProductiveActivityView: View {
    @Environment(\.dismiss) var dismiss

    @Bindable var productiveActivity: ProductiveActivity
    var body: some View {
        NavigationView {
            Form {
                TextField("Activity Name", text: $productiveActivity.productiveName)
                TextField("Description", text: $productiveActivity.productiveDescription)
            }
            .navigationTitle("Edit Activity")
            .navigationBarItems(trailing: Button("Save") {
                dismiss()
            }.disabled(productiveActivity.productiveName.isEmpty || productiveActivity.productiveDescription.isEmpty))
        }
    }
}

struct ProductiveActivities: App {
    var body: some Scene {
        WindowGroup {
            ProductiveActivityListView()
        }
        .modelContainer(for: ProductiveActivity.self)
    }
}

#Preview {
    ProductiveActivityListView()
        .modelContainer(for: ProductiveActivity.self, inMemory: true)
}


