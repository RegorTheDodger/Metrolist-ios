import Foundation
import MediaPlayer
import UIKit

final class NowPlayingManager {
    func update(with track: Track, elapsedTime: TimeInterval) {
        var info: [String: Any] = [
            MPMediaItemPropertyTitle: track.title,
            MPMediaItemPropertyArtist: track.artist,
            MPMediaItemPropertyAlbumTitle: track.album,
            MPMediaItemPropertyPlaybackDuration: track.duration,
            MPNowPlayingInfoPropertyElapsedPlaybackTime: elapsedTime
        ]

        if let artworkURL = track.artworkURL,
           let data = try? Data(contentsOf: artworkURL),
           let image = UIImage(data: data) {
            let artwork = MPMediaItemArtwork(boundsSize: image.size) { _ in image }
            info[MPMediaItemPropertyArtwork] = artwork
        }

        MPNowPlayingInfoCenter.default().nowPlayingInfo = info
    }

    func configureRemoteCommands(playAction: @escaping () -> Void, pauseAction: @escaping () -> Void) {
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.addTarget { _ in
            playAction()
            return .success
        }
        commandCenter.pauseCommand.addTarget { _ in
            pauseAction()
            return .success
        }
    }
}
