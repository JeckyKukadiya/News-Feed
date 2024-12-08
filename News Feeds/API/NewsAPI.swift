//
//  NewsAPI.swift
//  News Feeds
//
//  Created by ʝє¢ку кυкα∂ιуα on 08/12/24.
//

import Foundation

struct NewsAPI {
    static let shared = NewsAPI()
    private init() {}
    
    private let apiKey = "b75259f67b9d4b9a8e040ccc2f1fe4b4"
    private let session = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    func fetch(from category: Category) async throws -> [Article] {
        let url = generateNewsURL(for: category)
        let (data, response) = try await session.data(from: url)
        guard let respose = response as? HTTPURLResponse, respose.statusCode == 200 else {
            throw getError(description: "Bad server response")
        }
        switch respose.statusCode {
        case (200...299), (400...499):
            let apiResponse = try jsonDecoder.decode(NewsApiResponse.self, from: data)
            if apiResponse.status == "ok" {
                return apiResponse.articles ?? []
            } else {
                throw getError(description: apiResponse.message ?? "An error occured")
            }
        default:
            throw getError(description: "A server error occured.")
        }
    }
    
    private func getError(code: Int = 1, description: String) -> Error {
        NSError(domain: "NewsAPI", code: code, userInfo: [NSLocalizedDescriptionKey: description])
    }
    
    private func generateNewsURL(for category: Category) -> URL {
        var url = "https://newsapi.org/v2/top-headlines?"
        url += "apiKey=\(apiKey)"
        url += "&language=en"
        url += "&category=\(category.rawValue)"
        return URL(string: url)!
    }
}
