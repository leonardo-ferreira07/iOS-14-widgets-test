//
//  PullRequest.swift
//  MyWidgetExtension
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 26/06/20.
//

import Foundation

struct PullRequest: Decodable, Equatable {
    let title: String
    let body: String
    let date: String
    
    // MARK: - Coding Keys
    
    private enum CodingKeys: String, CodingKey {
        case title
        case body
        case date = "created_at"
    }
    
    static func == (lhs: PullRequest, rhs: PullRequest) -> Bool {
        lhs.title == lhs.title
    }
}
