//
//  NewsAPIService.swift
//  NewsApp
//
//  Created by Khaled Bohout on 06/11/2022.
//

import Combine
import Foundation

protocol NewsAPIServiceInterface {
    func fetchTopHeadlines(with country: Country, category: Category?) -> AnyPublisher<TopHeadlines, Error>
}

struct NewsAPIService: APIClient, NewsAPIServiceInterface {
    func fetchTopHeadlines(with country: Country, category: Category?) -> AnyPublisher<TopHeadlines, Error> {
        fetch(endpoint: NewsEndpoint.fetchNews(countryISO: country.iso2, category: category))
    }
}
