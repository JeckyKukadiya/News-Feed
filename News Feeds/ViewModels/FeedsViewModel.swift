//
//  FeedsViewModel.swift
//  News Feeds
//
//  Created by ʝє¢ку кυкα∂ιуα on 08/12/24.
//

import SwiftUI

enum DataFetchPhase<T> {
    case empty
    case success(T)
    case failure(Error)
}

struct FetchTaskToken: Equatable {
    var category: Category
    var token: Date
}

@MainActor
class FeedsViewModel: ObservableObject {
    @Published var phase = DataFetchPhase<[Article]>.empty
    @Published var fetchtaskToken: FetchTaskToken
    private let newsAPI = NewsAPI.shared
    
    init(articles: [Article]? = nil, selectedCategory: Category = .general) {
        if let articles = articles {
            self.phase = .success(articles)
        } else {
            self.phase = .empty
        }
        self.fetchtaskToken = FetchTaskToken(category: selectedCategory, token: Date())
    }
    
    func fetchFeeds() async {
//        phase = .success(Article.preViewData) ///For showing static data
        if Task.isCancelled { return }
        phase = .empty
        do {
            let articles = try await newsAPI.fetch(from: fetchtaskToken.category)
            if Task.isCancelled { return }
            phase = .success(articles)
        } catch {
            print(error.localizedDescription)
            if Task.isCancelled { return }
            phase = .failure(error)
        }
    }
}
