//
//  Coordinator.swift
//  NewsApp
//
//  Created by Khaled Bohout on 06/11/2022.
//

import UIKit

protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
