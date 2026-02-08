import Foundation

protocol SyncServiceProtocol {
    func syncLibrary() async throws
    func syncDownloads() async throws
}

final class SyncService: SyncServiceProtocol {
    func syncLibrary() async throws {
        // Connect to Innertube + account endpoints for library state.
    }

    func syncDownloads() async throws {
        // Sync offline metadata and playback history when online.
    }
}
