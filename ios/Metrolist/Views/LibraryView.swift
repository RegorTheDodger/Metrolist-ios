import SwiftUI

struct LibraryView: View {
    private let sections = [
        (title: "Playlists", count: 12, icon: "music.note.list"),
        (title: "Albums", count: 48, icon: "square.stack"),
        (title: "Artists", count: 24, icon: "music.mic"),
        (title: "Liked Songs", count: 320, icon: "heart")
    ]

    var body: some View {
        List {
            Section {
                ForEach(sections, id: \.title) { section in
                    HStack {
                        Image(systemName: section.icon)
                            .frame(width: 28)
                        Text(section.title)
                        Spacer()
                        Text("\(section.count)")
                            .foregroundColor(.secondary)
                    }
                }
            } header: {
                Text("Library Overview")
            } footer: {
                Text("Library sync is designed to match Android collections.")
            }
        }
        .navigationTitle("Library")
    }
}

#Preview {
    NavigationStack {
        LibraryView()
    }
}
