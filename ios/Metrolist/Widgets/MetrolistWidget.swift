import SwiftUI
import WidgetKit

struct MetrolistWidgetEntry: TimelineEntry {
    let date: Date
    let title: String
    let subtitle: String
}

struct MetrolistWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> MetrolistWidgetEntry {
        MetrolistWidgetEntry(date: Date(), title: "Now Playing", subtitle: "Quick Picks Radio")
    }

    func getSnapshot(in context: Context, completion: @escaping (MetrolistWidgetEntry) -> Void) {
        completion(placeholder(in: context))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<MetrolistWidgetEntry>) -> Void) {
        let entry = MetrolistWidgetEntry(date: Date(), title: "Offline Mix", subtitle: "Ready for takeoff")
        let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(15 * 60)))
        completion(timeline)
    }
}

struct MetrolistWidgetView: View {
    let entry: MetrolistWidgetProvider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(entry.title)
                .font(.headline)
            Text(entry.subtitle)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct MetrolistWidget: Widget {
    let kind: String = "MetrolistWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: MetrolistWidgetProvider()) { entry in
            MetrolistWidgetView(entry: entry)
        }
        .configurationDisplayName("Metrolist Now Playing")
        .description("Quick access to your current queue.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

#Preview(as: .systemSmall) {
    MetrolistWidget()
} timeline: {
    MetrolistWidgetEntry(date: Date(), title: "Now Playing", subtitle: "Quick Picks Radio")
}
