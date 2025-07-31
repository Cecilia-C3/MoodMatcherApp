//
//  Quotes.swift
//  MoodMatcher
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI

struct Quotes: View {
    @State private var quotes: [String] = [
        "Success is built on what you do daily",
        "Life isn't about finding yourself, it's about creating yourself",
        "Change is scary but so is staying the same",
        "Avoiding a task takes as much mental energy as doing it",
        "Studying is a privilege not a chore. There is a whole world of knowledge out there, and we have the opportunity to explore some of it. So change your mindset."
    ]
    
    @State private var newQuote: String = ""

    var body: some View {
        ZStack {
            Color(red: 0.639, green: 0.761, blue: 0.514)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        Text("📝")
                            .font(.system(size: 40))
                        Text("Quotes")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hue: 0.261, saturation: 0.664, brightness: 0.322))
                            .padding()
                            .border(Color(hue: 0.235, saturation: 0.174, brightness: 0.889), width:3)
                            .background(Color(hue: 0.222, saturation: 0.262, brightness: 0.77))
                            .padding(15)
                        Text("📝")
                            .font(.system(size: 40))
                    }
                    
                    Text("to stay In The Zone and for inspiration:")
                        .font(.title3)
                        .padding()
                        .background(
                            Capsule()
                                .fill(Color(hue: 0.236, saturation: 0.307, brightness: 0.923))
                        )
                        .overlay(
                            Capsule()
                                .stroke(Color(hue: 0.251, saturation: 0.356, brightness: 0.676), lineWidth: 2)
                        )
                        .shadow(radius: 2)

                    // MARK: - TextField and Button
                    HStack {
                        TextField("Type your quote here", text: $newQuote)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        
                        Button(action: {
                            if !newQuote.trimmingCharacters(in: .whitespaces).isEmpty {
                                quotes.append(newQuote)
                                newQuote = ""
                            }
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .font(.title2)
                        }
                        .padding(.trailing)
                    }

                    // MARK: - Display Quotes
                    ForEach(quotes.indices, id: \.self) { index in
                        HStack {
                            Text("- \(quotes[index])")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .foregroundColor(Color(hue: 0.261, saturation: 0.664, brightness: 0.322))
                                .padding()
                                .border(Color(hue: 0.235, saturation: 0.174, brightness: 0.889), width: 3)
                                .background(Color(hue: 0.222, saturation: 0.262, brightness: 0.77))
                                .padding(.horizontal)
                            
                            // Delete Button
                            Button(action: {
                                quotes.remove(at: index)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    Quotes()
}

