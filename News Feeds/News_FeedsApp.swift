//
//  News_FeedsApp.swift
//  News Feeds
//
//  Created by ʝє¢ку кυкα∂ιуα on 08/12/24.
//

import SwiftUI

@main
struct News_FeedsApp: App {
    
    @StateObject var bookmarkVM = BookmarkViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(bookmarkVM)
        }
    }
}
