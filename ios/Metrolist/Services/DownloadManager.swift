import Foundation

final class DownloadManager: NSObject {
    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.background(withIdentifier: "com.metrolist.downloads")
        configuration.allowsCellularAccess = false
        configuration.isDiscretionary = true
        configuration.sessionSendsLaunchEvents = true
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }()

    func enqueueDownload(from url: URL) {
        let task = session.downloadTask(with: url)
        task.resume()
    }
}

extension DownloadManager: URLSessionDownloadDelegate {
    func urlSession(
        _ session: URLSession,
        downloadTask: URLSessionDownloadTask,
        didFinishDownloadingTo location: URL
    ) {
        // Persist file to the cache directory or Core Data store.
    }
}
