import SwiftUI

struct SearchView: View {
    private let suggestions = [
        "Chill Mix",
        "Workout Beats",
        "Offline Favorites",
        "Top Artists",
        "Recently Added"
    ]

    var body: some View {
        List {
            Section {
                ForEach(suggestions, id: \.self) { suggestion in
                    Label(suggestion, systemImage: "sparkle.magnifyingglass")
                }
            } header: {
                Text("Smart Suggestions")
            } footer: {
                Text("Search integrates YouTube Music history and offline downloads.")
            }
        }
        .navigationTitle("Search")
    }
}

#Preview {
    NavigationStack {
        SearchView()
    }
}
