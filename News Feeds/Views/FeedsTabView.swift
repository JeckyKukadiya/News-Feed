//
//  TabView.swift
//  News Feeds
//
//  Created by ʝє¢ку кυкα∂ιуα on 08/12/24.
//

import SwiftUI

struct FeedsTabView: View {
    
    @StateObject var feedsViewModel: FeedsViewModel = .init()
    
    var body: some View {
        NavigationStack {
            FeedListView(articles: articles)
                .overlay(overlayView)
                .task(id: feedsViewModel.fetchtaskToken, loadFeeds)
                .refreshable {
                    refreshData()
                }
                .navigationTitle(feedsViewModel.fetchtaskToken.category.text)
                .toolbar {
                    ToolbarItem(placement:.navigationBarTrailing) {
                        menu
                    }
                }
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        switch feedsViewModel.phase {
        case .empty:
            ProgressView()
        case .success(let articles) where articles.isEmpty: EmptyPlaceholderView(text: "No Feeds available", image: nil)
        case .failure(let error):
            RetryView(text: error.localizedDescription, retryAction: refreshData)
        default:
            EmptyView()
        }
    }
    
    private var articles: [Article] {
        if case let .success(articles) = feedsViewModel.phase {
            return articles
        } else {
            return []
        }
    }
    
    @Sendable private func loadFeeds() async {
        await feedsViewModel.fetchFeeds()
    }
    
    private func refreshData() {
        feedsViewModel.fetchtaskToken = FetchTaskToken(category: feedsViewModel.fetchtaskToken.category, token: Date())
    }
    
    private var menu: some View {
        Menu {
            Picker("Category", selection: $feedsViewModel.fetchtaskToken.category) {
                ForEach(Category.allCases) {
                    Text($0.text).tag($0)
                }
            }
        } label: {
            Image(systemName: "fiberchannel")
                .imageScale(.large)
        }
    }
}

#Preview {
    @Previewable @StateObject var bookmarkVM = BookmarkViewModel()
    FeedsTabView(feedsViewModel: FeedsViewModel(articles: Article.preViewData))
        .environmentObject(bookmarkVM)
}
