//
//  BookmarkTab.swift
//  News Feeds
//
//  Created by ʝє¢ку кυкα∂ιуα on 08/12/24.
//

import SwiftUI

struct BookmarkTabView: View {
    
    @EnvironmentObject var bookmarkVM: BookmarkViewModel
    
    var body: some View {
        NavigationStack {
            FeedListView(articles: bookmarkVM.bookmarks)
                .overlay(overlayView(isEmpty: bookmarkVM.bookmarks.isEmpty))
                .navigationTitle("Saved Articles")
        }
    }
    
    @ViewBuilder
    func overlayView(isEmpty: Bool) -> some View {
        if isEmpty {
            EmptyPlaceholderView(text: "No Saved Articles", image: Image(systemName: "bookmark"))
        }
    }
}

#Preview {
    @Previewable @StateObject var bookmarkVM = BookmarkViewModel()
    BookmarkTabView()
        .environmentObject(bookmarkVM)
}
