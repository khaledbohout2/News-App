//
//  FetchCountriesUseCase.swift
//  NewsApp
//
//  Created by Khaled Bohout on 06/11/2022.
//

import Foundation
import Combine

protocol FetchCountriesUseCaseInterface {
    func perform() -> AnyPublisher<CountriesList, Error>
}

final class FetchCountriesUseCase: FetchCountriesUseCaseInterface {
    
    private let newsRepository: NewsRepository
    
    init(newsRepository: NewsRepository) {
        self.newsRepository = newsRepository
    }
    
    func perform() -> AnyPublisher<CountriesList, Error> {
        newsRepository.fetchCountries()
    }
}
