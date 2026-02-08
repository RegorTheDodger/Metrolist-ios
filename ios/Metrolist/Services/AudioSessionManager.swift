import AVFoundation
import Foundation

final class AudioSessionManager {
    func configureForPlayback() throws {
        let session = AVAudioSession.sharedInstance()
        try session.setCategory(.playback, mode: .default, options: [.allowAirPlay, .allowBluetooth])
        try session.setActive(true)
    }
}
