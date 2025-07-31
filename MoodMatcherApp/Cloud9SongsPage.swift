//
//  Cloud9SongsPage.swift
//  MoodMatcher
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI
import SwiftData

@Model
class Cloud9Song {
    var title: String
    var artist: String

    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
}

struct Cloud9SongsView: View {
    @Query private var userSongs: [Cloud9Song]
    @Environment(\.modelContext) private var modelContext
    @State private var showingAddSong = false

    let setSongs = [
        Cloud9Song(title: "Can’t Stop the Feeling", artist: "Justin Timberlake"),
        Cloud9Song(title: "Chicken Fried", artist: "Zac Brown Band"),
        Cloud9Song(title: "Hey Ya!", artist: "OutKast")
    ]

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.9176, green: 0.4706, blue: 0.3451) // Cloud 9 background
                    .ignoresSafeArea()

                VStack(spacing: 10) {
                    Image(systemName: "sun.max.fill")
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
            .navigationTitle("Cloud 9: Tunes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddSong = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 18, weight: .bold))
                            .padding(12)
                            .background(Circle().fill(Color.white))
                            .foregroundColor(Color(red: 0.9176, green: 0.4706, blue: 0.3451))
                            .shadow(radius: 3)
                    }
                }
            }
            .sheet(isPresented: $showingAddSong) {
                AddCloud9SongView()
            }
        }
    }

    func deleteUserSongs(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(userSongs[index])
        }
    }
}

struct AddCloud9SongView: View {
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
                        let newSong = Cloud9Song(title: title, artist: artist)
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
    Cloud9SongsView()
        .modelContainer(for: Cloud9Song.self, inMemory: true)
}
