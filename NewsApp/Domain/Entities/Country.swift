//
//  Country.swift
//  NewsApp
//
//  Created by Khaled Bohout on 06/11/2022.
//

import Foundation

// MARK: - Country
struct Country: Codable, Hashable {
    fileprivate let id = UUID()
    let name, iso2: String?

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

typealias CountriesList = [Country]
