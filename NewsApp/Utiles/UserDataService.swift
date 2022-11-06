//
//  UserDataService.swift
//  NewsApp
//
//  Created by Khaled Bohout on 05/11/2022.
//

import Foundation

class UserDataService: NSObject {

    static let sharedInstance = UserDataService()

    private override init () { }

    var selectedFilter: User?

}
