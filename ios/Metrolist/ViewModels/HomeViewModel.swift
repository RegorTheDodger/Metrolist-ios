import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var queue: [Track] = Track.previewQueue
    @Published var lastSyncDate: Date? = nil

    private let syncService: SyncServiceProtocol

    init(syncService: SyncServiceProtocol = SyncService()) {
        self.syncService = syncService
    }

    func refresh() async {
        do {
            try await syncService.syncLibrary()
            lastSyncDate = Date()
        } catch {
            // Handle sync errors (show toast or alert).
        }
    }
}
