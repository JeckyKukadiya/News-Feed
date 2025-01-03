//
//  ArticleRow.swift
//  News Feeds
//
//  Created by ʝє¢ку кυкα∂ιуα on 08/12/24.
//

import SwiftUI

struct ArticleRow: View {
    
    @EnvironmentObject var bookmarkVM: BookmarkViewModel
    
    let article: Article
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AsyncImage(url: article.imageURL) { phase in
                switch phase {
                case .empty:
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                case .failure:
                    HStack {
                        Spacer()
                        Image(systemName: "photo")
                            .imageScale(.large)
                        Spacer()
                    }
                    
                @unknown default:
                    fatalError()
                }
            }
            .frame(minHeight: 200, maxHeight: 300)
            .background(Color.gray.opacity(0.3))
            .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(3)
                Text(article.descriptionText)
                    .font(.subheadline)
                    .lineLimit(2)
                HStack {
                    Text(article.captionText)
                        .lineLimit(1)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                    Spacer()
                    Button {
                        toggleBookmark(for: article)
                    } label: {
                        Image(systemName: bookmarkVM.isBookMarked(for: article) ? "bookmark.fill" : "bookmark")
                    }
                    .buttonStyle(.bordered)
                    Button {
                        presentShareSheet(url: article.articleURL)
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .buttonStyle(.bordered)
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
    
    private func toggleBookmark(for article: Article) {
        bookmarkVM.isBookMarked(for: article) ? bookmarkVM.removeBookmark(for: article) : bookmarkVM.addBookmark(for: article)
    }
}

extension View {
    func presentShareSheet(url: URL) {
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
            .keyWindow?
            .rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

#Preview {
    @Previewable @StateObject var bookmarkVM = BookmarkViewModel()
    List {
        ArticleRow(article: .preViewData[0])
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .environmentObject(bookmarkVM)
    }
    .listStyle(.plain)
    
}
