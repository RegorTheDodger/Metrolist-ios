import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = HomeViewModel()

    private let coreFeatures: [Feature] = [
        .quickPicks,
        .playback,
        .downloads,
        .syncing,
        .listenTogether
    ]

    private let playbackTools: [Feature] = [
        .liveLyrics,
        .audioTuning,
        .themes,
        .widgets
    ]

    var body: some View {
        TabView {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        SectionHeader(
                            title: "Metrolist for iOS",
                            subtitle: "A SwiftUI experience designed to match Android features with a native feel on iPhone 6s and newer."
                        )

                        statusCard
                        nowPlayingCard

                        SectionHeader(
                            title: "Core Features",
                            subtitle: "Everything Android users expect, prioritized for iOS."
                        )

                        ForEach(coreFeatures) { feature in
                            FeatureRow(feature: feature)
                        }

                        SectionHeader(
                            title: "Playback Tools",
                            subtitle: "Enhancements for lyrics, audio tuning, and themes."
                        )

                        ForEach(playbackTools) { feature in
                            FeatureRow(feature: feature)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 32)
                }
                .navigationTitle("Home")
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }

            NavigationStack {
                SearchView()
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }

            NavigationStack {
                LibraryView()
            }
            .tabItem {
                Label("Library", systemImage: "music.note.list")
            }

            NavigationStack {
                DownloadsView()
            }
            .tabItem {
                Label("Downloads", systemImage: "arrow.down.circle")
            }

            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape")
            }
        }
    }

    private var statusCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Feature Parity Progress")
                .font(.headline)

            Text("This starter build enumerates Android parity goals and highlights iOS-specific requirements like background audio and widget support.")
                .font(.subheadline)
                .foregroundColor(.secondary)

            HStack {
                Label("iPhone 6s+", systemImage: "iphone")
                Spacer()
                Label("iOS 13+", systemImage: "checkmark.seal")
            }
            .font(.caption)
            .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(16)
    }

    private var nowPlayingCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Now Playing Queue")
                    .font(.headline)
                Spacer()
                Button("Sync") {
                    Task { await viewModel.refresh() }
                }
                .buttonStyle(.bordered)
                .controlSize(.small)
            }

            ForEach(viewModel.queue) { track in
                VStack(alignment: .leading, spacing: 4) {
                    Text(track.title)
                        .font(.subheadline.weight(.semibold))
                    Text("\(track.artist) · \(track.album)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            if let lastSync = viewModel.lastSyncDate {
                Text("Last synced \(lastSync.formatted(date: .abbreviated, time: .shortened))")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            } else {
                Text("Sync your library to fetch the latest queue.")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(16)
    }
}

#Preview {
    ContentView()
}
