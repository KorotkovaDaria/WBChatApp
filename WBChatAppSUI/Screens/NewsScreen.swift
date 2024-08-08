//
//  NewsScreen.swift
//  WBChatAppSUI
//
//  Created by Daria on 06.08.2024.
//

import SwiftUI
import NewsAPI

enum LoadingStatus: CaseIterable {
    case Loading, NotLoading
}

struct Articles {
    
    var articles: [Article] = []
    
    init() {}
    
    mutating func loadNews(complete: @escaping (_ data: ArticleList?, _ error: Error?) -> Void) {
        ArticlesAPI.everythingGet(  q: "iPhone 17",
                                    from: "2024-07-25",
                                    sortBy: "publishedAt",
                                    language: "en",
                                    apiKey: "8e7caac0fb8c4c2ba9f3324db7ed392d") { data, error in
            complete(data, error)
        }
    }
    
}

extension Article: Identifiable {
    
    public var id: String { url }
    
}

struct NewsScreen: View {
    
    @State var articles: Articles = .init()
    
    var body: some View {
        VStack {
            List {
                ForEach(articles.articles) { art in
                    NewsCell(article: art)
                }
            }.task {
                articles.loadNews { data, error in
                    articles.articles.append(contentsOf: data?.articles ?? [])
                }
            }
        }
    }
}

struct NewsCell: View {
    
    var article: Article?
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(12)
                .foregroundColor(.gray.opacity(0.2))
            VStack {
                Text(article?.title ?? "NO TITLE").font(.headline)
                Spacer().frame(height: 12)
                Text(article?.description ?? "NO DESC").font(.caption)
            }
            .padding()
            
        }
    }
}

