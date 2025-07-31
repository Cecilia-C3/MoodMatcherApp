//
//  InTheZoneSongsPage.swift
//  MoodMatcher
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI
import SwiftData

@Model
class InTheZoneSong {
    var title: String
    var artist: String

    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
}

struct InTheZoneSongsView: View {
    @Query private var userSongs: [InTheZoneSong]
    @Environment(\.modelContext) private var modelContext
    @State private var showingAddSong = false

    let setSongs = [
        InTheZoneSong(title: "Lujon", artist: "Henry Mancini"),
        InTheZoneSong(title: "Ladyfingers", artist: "Herb Alpert & The Tijuana Brass"),
        InTheZoneSong(title: "Mary’s Theme", artist: "Stelvio Cipriani")
    ]

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.6392, green: 0.7608, blue: 0.5137) // In The Zone background
                    .ignoresSafeArea()

                VStack(spacing: 10) {
                    Image(systemName: "brain.head.profile")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .padding(.top)

                    List {
                        Section(header: Text("Set Songs")
                            .fontWeight(.bold)
                            .foregroundColor(.black)) {
                                ForEach(setSongs, id: \.title) { song in
                                    VStack(alignment: .leading) {
                                        Text(song.title).font(.headline)
                                        Text(song.artist).font(.subheadline)
                                    }
                                    .padding(.vertical, 4)
                                }
                        }

                        Section(header: Text("Your Songs")
                            .fontWeight(.bold)
                            .foregroundColor(.black)) {
                                ForEach(userSongs) { song in
                                    VStack(alignment: .leading) {
                                        Text(song.title).font(.headline)
                                        Text(song.artist).font(.subheadline)
                                    }
                                    .padding(.vertical, 4)
                                }
                                .onDelete(perform: deleteUserSongs)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                }
            }
            .navigationTitle("In the Zone")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddSong = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 18, weight: .bold))
                            .padding(12)
                            .background(Circle().fill(Color.white))
                            .foregroundColor(Color(red: 0.6392, green: 0.7608, blue: 0.5137))
                            .shadow(radius: 3)
                    }
                }
            }
            .sheet(isPresented: $showingAddSong) {
                AddInTheZoneSongView()
            }
        }
    }

    func deleteUserSongs(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(userSongs[index])
        }
    }
}

struct AddInTheZoneSongView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State private var title = ""
    @State private var artist = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Song Title", text: $title)
                TextField("Artist", text: $artist)
            }
            .navigationTitle("Add Song")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let newSong = InTheZoneSong(title: title, artist: artist)
                        modelContext.insert(newSong)
                        dismiss()
                    }
                    .disabled(title.isEmpty || artist.isEmpty)
                }
            }
        }
    }
}

#Preview {
    InTheZoneSongsView()
        .modelContainer(for: InTheZoneSong.self, inMemory: true)
}
