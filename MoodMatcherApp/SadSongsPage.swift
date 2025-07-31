//
//  SadSongsPage.swift
//  MoodMatcher
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI
import SwiftData

@Model
class SadSong {
    var title: String
    var artist: String

    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
}

struct SadSongsView: View {
    @Query private var userSongs: [SadSong]
    @Environment(\.modelContext) private var modelContext
    @State private var showingAddSong = false

    let setSongs = [
        SadSong(title: "Unwritten", artist: "Natasha Bedingfield"),
        SadSong(title: "Adventure of a Lifetime", artist: "Coldplay"),
        SadSong(title: "In My Room", artist: "Chance Pena"),
        SadSong(title: "Fine Line", artist: "Harry Styles"),
        SadSong(title: "Till Forever Falls Apart", artist: "Ashe, FINNEAS")
    ]

    var body: some View {
        NavigationView {
            ZStack {
                Color(hue: 0.626, saturation: 0.391, brightness: 0.785)
                    .ignoresSafeArea()

                VStack(spacing: 10) {
                    Image(systemName: "music.note.list")
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
            .navigationTitle("Bye The Blues: Tunes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddSong = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 18, weight: .bold))
                            .padding(12)
                            .background(Circle().fill(Color.white))
                            .foregroundColor(Color(hue: 0.626, saturation: 0.391, brightness: 0.785))
                            .shadow(radius: 3)
                    }
                }
            }
            .sheet(isPresented: $showingAddSong) {
                AddSadSongView()
            }
        }
    }

    func deleteUserSongs(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(userSongs[index])
        }
    }
}

struct AddSadSongView: View {
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
                        let newSong = SadSong(title: title, artist: artist)
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
    SadSongsView()
        .modelContainer(for: SadSong.self, inMemory: true)
}
