//
//  BookmarkViewModel.swift
//  News Feeds
//
//  Created by ʝє¢ку кυкα∂ιуα on 08/12/24.
//

import SwiftUI

@MainActor
class BookmarkViewModel: ObservableObject {
    @Published private(set) var bookmarks: [Article] = []
    
    func isBookMarked(for article: Article) -> Bool {
        bookmarks.first { article.id == $0.id } != nil
    }
    
    func addBookmark(for article: Article) {
        guard !isBookMarked(for: article) else { return }
        bookmarks.insert(article, at: 0)
    }
    
    func removeBookmark(for article: Article) {
        guard let index = bookmarks.firstIndex(where: {$0.id == article.id }) else { return }
        bookmarks.remove(at: index)
    }
}
