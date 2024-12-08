//
//  FeedListView.swift
//  News Feeds
//
//  Created by ʝє¢ку кυкα∂ιуα on 08/12/24.
//

import SwiftUI

struct FeedListView: View {
    
    let articles: [Article]
    @State private var selectedArticle: Article?
    
    var body: some View {
        List {
            ForEach(articles) { article in
                ArticleRow(article: article)
                    .onTapGesture {
                        selectedArticle = article
                    }
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .sheet(item: $selectedArticle) {
            SafariView(url: $0.articleURL)
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    @Previewable @StateObject var bookmarkVM = BookmarkViewModel()
    FeedListView(articles: Article.preViewData)
        .environmentObject(bookmarkVM)
}
