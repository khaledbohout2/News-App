//
//  FetchCategoriesUseCase.swift
//  NewsApp
//
//  Created by Khaled Bohout on 06/11/2022.
//

import Foundation
import Combine

protocol FetchCategoriesUseCaseInterface {
    func perform() -> AnyPublisher<[Category], Error>
}

final class FetchCategoriesUseCase: FetchCategoriesUseCaseInterface {
    
    private let newsRepository: NewsRepository
    
    init(newsRepository: NewsRepository) {
        self.newsRepository = newsRepository
    }

    func perform() -> AnyPublisher<[Category], Error> {
        newsRepository.fetchCategories()
    }
}

