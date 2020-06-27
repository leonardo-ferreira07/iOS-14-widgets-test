//
//  SwiftRepoPullRequestsTimeline.swift
//  MyWidgetExtension
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 26/06/20.
//

import WidgetKit
import Foundation
import Combine

class SwiftRepoPullRequestsTimeline: TimelineProvider {
    // MARK: - Type aliases
    
    typealias Entry = PullRequestsEntry
    
    //MARK: - Properties
    
    var disposables = Set<AnyCancellable>()
}

extension SwiftRepoPullRequestsTimeline {
    func snapshot(with context: Context, completion: @escaping (PullRequestsEntry) -> ()) {
        let fakePr = PullRequest(title: "Fake Swift 1.0 implementation", body: "Fake description", date: "01-01-1900")
        let entry = PullRequestsEntry(date: Date(), pullRequests: [fakePr])
        
        completion(entry)
    }
    
    func timeline(with context: Context, completion: @escaping (Timeline<PullRequestsEntry>) -> ()) {
        let pullRequestsService: PullRequestsService = .init()
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)!
        var prs: [PullRequest] = []

        pullRequestsService.fetchPullRequests(withOwner: "apple", repository: "swift")
        .sink(receiveCompletion: { value in
            switch value {
            case .failure( let error):
                let fakePr = PullRequest(title: "Fake Swift 1.0 implementation", body: "Fake description", date: "01-01-1900")
                prs = [fakePr]
                print("## \(error)")
                
                let entry = PullRequestsEntry(date: currentDate, pullRequests: prs)
                let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
                completion(timeline)
            case .finished:
                break
            }
        },
        receiveValue: { pullRequests in
            prs = pullRequests
            
            let entry = PullRequestsEntry(date: currentDate, pullRequests: prs)
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        })
        .store(in: &disposables)
    }
}

struct PullRequestsEntry: TimelineEntry {
    public let date: Date
    public let pullRequests: [PullRequest]
    
    var relevance: TimelineEntryRelevance? {
        return TimelineEntryRelevance(score: 10) // 0 - not important | 100 - very important
    }
}
