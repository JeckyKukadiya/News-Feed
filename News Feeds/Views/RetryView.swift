//
//  RetryView.swift
//  News Feeds
//
//  Created by ʝє¢ку кυкα∂ιуα on 08/12/24.
//

import SwiftUI

struct RetryView: View {
    
    let text: String
    let retryAction: () -> ()
    
    var body: some View {
        VStack(spacing: 8) {
            Text(text)
                .font(.callout)
                .multilineTextAlignment(.center)
            Button(action: retryAction) {
                Text("Try Again")
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var bookmarkVM = BookmarkViewModel()
    RetryView(text: "Try Again") {
        
    }
    .environmentObject(bookmarkVM)
}
