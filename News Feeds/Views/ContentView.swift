//
//  ContentView.swift
//  News Feeds
//
//  Created by ʝє¢ку кυкα∂ιуα on 08/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FeedsTabView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            
            BookmarkTabView()
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark")
                }
        }
    }
}

#Preview {
    @Previewable @StateObject var bookmarkVM = BookmarkViewModel()
    ContentView()
        .environmentObject(bookmarkVM)
}

