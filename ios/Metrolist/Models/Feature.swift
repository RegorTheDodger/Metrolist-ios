import Foundation

struct Feature: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let systemImage: String
    let availabilityNote: String?
}

extension Feature {
    static let quickPicks = Feature(
        title: "Quick Picks",
        subtitle: "Personalized picks that update with your listening history.",
        systemImage: "sparkles",
        availabilityNote: nil
    )

    static let downloads = Feature(
        title: "Offline Downloads",
        subtitle: "Cache songs, albums, and playlists for offline playback.",
        systemImage: "arrow.down.circle",
        availabilityNote: "Requires background refresh permissions."
    )

    static let syncing = Feature(
        title: "Account Sync",
        subtitle: "Keep your library, likes, and playlists in sync with YouTube Music.",
        systemImage: "arrow.triangle.2.circlepath",
        availabilityNote: "Sign-in with your YouTube Music account."
    )

    static let liveLyrics = Feature(
        title: "Live Lyrics",
        subtitle: "Sing along with time-synced lyrics and translations.",
        systemImage: "music.note.list",
        availabilityNote: nil
    )

    static let listenTogether = Feature(
        title: "Listen Together",
        subtitle: "Share a session code so friends can queue tracks together.",
        systemImage: "person.2.wave.2",
        availabilityNote: "Uses local network or share links."
    )

    static let audioTuning = Feature(
        title: "Audio Tuning",
        subtitle: "Normalize loudness, adjust tempo, and pitch per track.",
        systemImage: "slider.horizontal.3",
        availabilityNote: nil
    )

    static let playback = Feature(
        title: "Background Playback",
        subtitle: "Continue listening with the screen locked or in other apps.",
        systemImage: "play.circle",
        availabilityNote: "Requires audio background mode."
    )

    static let themes = Feature(
        title: "Themes",
        subtitle: "Light, dark, black, and dynamic color themes.",
        systemImage: "paintbrush.pointed",
        availabilityNote: nil
    )

    static let widgets = Feature(
        title: "Home Screen Widgets",
        subtitle: "Playback controls on the lock screen and home screen.",
        systemImage: "rectangle.grid.2x2",
        availabilityNote: "Widgets require iOS 14+."
    )
}
