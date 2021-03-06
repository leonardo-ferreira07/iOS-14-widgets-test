//
//  PullRequestsWidgetView.swift
//  MyWidgetExtension
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 26/06/20.
//

import SwiftUI

struct PlaceholderView : View {
    var body: some View {
        PullRequestsWidgetView(entry: PullRequestsEntry(date: Date(), pullRequests: []))
    }
}

struct PullRequestsWidgetView : View {
    let entry: PullRequestsEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("apple/swift's Latest Pull Requests")
                .font(.system(.title3))
                .foregroundColor(.black)
            HStack(alignment: .center, spacing: 4) {
                if entry.pullRequests.isEmpty {
                    Text("Nothing yet")
                } else if entry.pullRequests.count >= 3 {
                    PrView(pr: entry.pullRequests[0])
                    PrView(pr: entry.pullRequests[1])
                    PrView(pr: entry.pullRequests[2])
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom))
    }
}

struct PrView: View {
    
    let pr: PullRequest
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(pr.title)
                .font(.system(.callout))
                .foregroundColor(.black)
                .bold()
            Text(pr.body)
                .font(.system(.caption))
                .foregroundColor(.black)
        }
    }
    
}

struct PullRequestsWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        PullRequestsWidgetView(entry: PullRequestsEntry(date: Date(), pullRequests: [PullRequest(title: "Fake Swift 1.0 implementation", body: "Fake description", date: "01-01-1900"), PullRequest(title: "Fake Swift 2.0 implementation", body: "Fake description", date: "01-01-1900"), PullRequest(title: "Fake Swift 3.0 implementation", body: "Fake description", date: "01-01-1900")]))
    }
}
