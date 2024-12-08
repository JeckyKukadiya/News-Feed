//
//  NewsApiResponse.swift
//  News Feeds
//
//  Created by ʝє¢ку кυкα∂ιуα on 08/12/24.
//

import Foundation

struct NewsApiResponse: Decodable {
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    let code: String?
    let message: String?
}
