//
//  BrainFogSongsPage.swift
//  MoodMatcher
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI
import SwiftData

@Model
class BrainFogSong {
    var title: String
    var artist: String

    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
}

struct BrainFogSongsView: View {
    @Query private var userSongs: [BrainFogSong]
    @Environment(\.modelContext) private var modelContext
    @State private var showingAddSong = false

    let setSongs = [
        BrainFogSong(title: "Boredom (feat. Rex Orange County & Anna of the North)", artist: "Tyler, The Creator"),
        BrainFogSong(title: "Go Your Own Way", artist: "Fleetwood Mac"),
        BrainFogSong(title: "Ain’t It Fun", artist: "Paramore")
    ]

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.9294, green: 0.7451, blue: 0.8941) // Brain Fog background
                    .ignoresSafeArea()

                VStack(spacing: 10) {
                    Image(systemName: "cloud.fog.fill")
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
            .navigationTitle("Brain Fog: Songs")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddSong = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 18, weight: .bold))
                            .padding(12)
                            .background(Circle().fill(Color.white))
                            .foregroundColor(Color(red: 0.9294, green: 0.7451, blue: 0.8941))
                            .shadow(radius: 3)
                    }
                }
            }
            .sheet(isPresented: $showingAddSong) {
                AddBrainFogSongView()
            }
        }
    }

    func deleteUserSongs(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(userSongs[index])
        }
    }
}

struct AddBrainFogSongView: View {
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
                        let newSong = BrainFogSong(title: title, artist: artist)
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
    BrainFogSongsView()
        .modelContainer(for: BrainFogSong.self, inMemory: true)
}
