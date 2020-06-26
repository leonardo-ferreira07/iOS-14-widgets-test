//
//  PullRequestsWidgetView.swift
//  MyWidgetExtension
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 26/06/20.
//

import SwiftUI

struct PlaceholderView : View {
    var body: some View {
        Text("Loading...")
    }
}

struct PullRequestsWidgetView : View {
    let entry: PullRequestsEntry

    var body: some View {
        VStack {
            Text("apple/swift's Latest Pull Requests")
                .font(.system(.title3))
                .foregroundColor(.black)
            HStack {
                PrView(pr: entry.pullRequests[0])
                PrView(pr: entry.pullRequests[1])
                PrView(pr: entry.pullRequests[2])
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
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
