//
//  FetchNewsUseCase.swift
//  NewsApp
//
//  Created by Khaled Bohout on 06/11/2022.
//

import Foundation
import Combine

protocol FetchTopHeadlinesUseCaseInterface {
    func perform(with country: Country, category: Category?) -> AnyPublisher<TopHeadlines, Error>
}

final class FetchTopHeadlinesUseCase: FetchTopHeadlinesUseCaseInterface {
    
    private let newsRepository: NewsRepository
    
    init(newsRepository: NewsRepository) {
        self.newsRepository = newsRepository
    }
    
    func perform(with country: Country, category: Category?) -> AnyPublisher<TopHeadlines, Error> {
        newsRepository.fetchTopHeadlines(with: country, category: category)
    }
}
