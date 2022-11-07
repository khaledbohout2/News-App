//
//  NewsDetailsViewModel.swift
//  NewsApp
//
//  Created by Khaled Bohout on 06/11/2022.
//

import Foundation
import Combine

final class NewsDetailsViewModel {
    
    private let article: Article
    private(set) var articleSubject = PassthroughSubject<Article, Never>()

    init(with article: Article) {
        self.article = article
    }

    func viewDidLoad() {
        articleSubject.send(article)
    }

}
