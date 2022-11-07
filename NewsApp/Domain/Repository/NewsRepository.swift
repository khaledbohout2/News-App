//
//  NewsRepository.swift
//  NewsApp
//
//  Created by Khaled Bohout on 06/11/2022.
//

import Combine

protocol NewsRepository {
    func fetchTopHeadlines(with country: Country, category: Category?) -> AnyPublisher<TopHeadlines, Error>
    func fetchCountries() -> AnyPublisher<CountriesList, Error>
    func fetchCategories() -> AnyPublisher<[Category], Error>
}
