//
//  EmptyPlaceholderView.swift
//  News Feeds
//
//  Created by ʝє¢ку кυкα∂ιуα on 08/12/24.
//

import SwiftUI

struct EmptyPlaceholderView: View {
    let text: String
    let image: Image?
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            if let image = self.image {
                image
                    .imageScale(.large)
                    .font(.system(size: 52))
            }
            Text(text)
            Spacer()
        }
    }
}

#Preview {
    @Previewable @StateObject var bookmarkVM = BookmarkViewModel()
    EmptyPlaceholderView(text: "No Bookmarks", image: Image(systemName: "bookmark"))
        .environmentObject(bookmarkVM)
}
