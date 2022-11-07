//
//  OnboardingViewModel.swift
//  NewsApp
//
//  Created by Khaled Bohout on 07/11/2022.
//

import Foundation
import Combine

final class OnboardingViewModel {
    private let fetchCountriesUseCase: FetchCountriesUseCaseInterface
    private let fetchCategoriesUseCase: FetchCategoriesUseCaseInterface

    @Published private(set) var filters: (CountriesList, [Category]) = ([], [])
    @Published private(set) var state: ViewState = .loading
    private var subscriptions = Set<AnyCancellable>()
    
    var selectedFilters: (Country, Category)?
    
    var defaultFilters: (Country, Category) {
        return (filters.0.first(where: { $0.iso2?.lowercased() == "us" })!, Category.allNews)
    }
    
    init(fetchCountriesUseCase: FetchCountriesUseCaseInterface,
         fetchCategoriesUseCase: FetchCategoriesUseCaseInterface) {
        self.fetchCountriesUseCase = fetchCountriesUseCase
        self.fetchCategoriesUseCase = fetchCategoriesUseCase
    }
    
    func viewDidLoad() {
        fetchFilters()
    }
    
    private func fetchFilters() {
        fetchCountriesUseCase.perform()
            .combineLatest(fetchCategoriesUseCase.perform())
            .sink { completion in
                if case .failure(let error) = completion {
                    print("error: \(error)")
                    self.state = .error(message: ViewModelError.faildFiltersLoading.message)
                }
            } receiveValue: { countries, categories in
                self.filters = (countries, categories)
                self.selectedFilters = self.defaultFilters
            }.store(in: &subscriptions)

    }

    func didUpdateFilters(selectedFilters: (Country, Category)) {
        UserDataService.sharedInstance.selectedFilters = selectedFilters
        UserDefaultsService.sharedInstance.firstLaunch = true
    }

    enum ViewModelError: Error {
        case faildFiltersLoading
        case faildTopHeadlinesLoading

        var message: String {
            switch self {
            case .faildFiltersLoading:
                return "Failed to load Filters"
            case .faildTopHeadlinesLoading:
                return "Failed to load top headlines from API"
            }
        }
    }

}
