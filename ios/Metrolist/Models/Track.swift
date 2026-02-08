import Foundation

struct Track: Identifiable, Equatable {
    let id: UUID
    let title: String
    let artist: String
    let album: String
    let duration: TimeInterval
    let artworkURL: URL?

    init(
        id: UUID = UUID(),
        title: String,
        artist: String,
        album: String,
        duration: TimeInterval,
        artworkURL: URL? = nil
    ) {
        self.id = id
        self.title = title
        self.artist = artist
        self.album = album
        self.duration = duration
        self.artworkURL = artworkURL
    }
}

extension Track {
    static let previewQueue: [Track] = [
        Track(title: "Quick Picks Radio", artist: "Metrolist", album: "Daily Mix", duration: 182),
        Track(title: "Offline Favorites", artist: "Metrolist", album: "Saved Mix", duration: 201),
        Track(title: "Live Lyrics", artist: "Metrolist", album: "Sing Along", duration: 194)
    ]
}
