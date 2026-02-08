import SwiftUI

struct SettingsView: View {
    private let toggles = [
        (title: "Audio Normalization", icon: "waveform"),
        (title: "Skip Silence", icon: "forward.end"),
        (title: "Dynamic Theme", icon: "paintbrush"),
        (title: "Sleep Timer", icon: "moon.zzz")
    ]

    var body: some View {
        Form {
            Section("Playback") {
                ForEach(toggles, id: \.title) { toggle in
                    Toggle(isOn: .constant(true)) {
                        Label(toggle.title, systemImage: toggle.icon)
                    }
                }
            }

            Section("Account") {
                LabeledContent("Signed in as", value: "you@metrolist.app")
                Button("Sync Library Now") {}
            }

            Section("About") {
                LabeledContent("Build", value: "iOS Preview")
                LabeledContent("Support", value: "iPhone 6s and newer")
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
