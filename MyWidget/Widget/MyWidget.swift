//
//  MyWidget.swift
//  MyWidget
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 26/06/20.
//

import WidgetKit
import SwiftUI

@main
struct SwiftRepoPullRequestsWidget: Widget {
    private let kind: String = "SwiftRepoPullRequestsWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: SwiftRepoPullRequestsTimeline(), placeholder: PlaceholderView()) { entry in
            PullRequestsWidgetView(entry: entry)
        }
        .configurationDisplayName("Swift's Latest Pull Requests")
        .description("Shows the last three pull requests at the Swift repo.")
    }
}
