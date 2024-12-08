//
//  Category.swift
//  News Feeds
//
//  Created by ʝє¢ку кυкα∂ιуα on 08/12/24.
//

import Foundation

enum Category: String, CaseIterable {
    case general
    case technology
    case science
    case sports
    case entertainment
    case business
    case health
    
    var text: String {
        switch self {
        case .general: return "Top Headlines"
        case .technology: return "Technology"
        case .science: return "Science"
        case .sports: return "Sports"
        case .entertainment: return "Entertainment"
        case .business: return "Business"
        case .health: return "Health"
        }
    }
}

extension Category: Identifiable {
    var id: Self { self }
}
