//
//  Protocol.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 9.06.2024.
//

import SwiftUI
import SwiftData

protocol SwiftDataViewModelProtocol: ObservableObject {
    associatedtype Item: PersistentModel
    var items: [Item] { get }
    func appendItem(_ item: Item)
    func removeItem(at index: Int)
    func fetchItems()
}

protocol DataSourceProtocol {
    associatedtype Item: PersistentModel
    func appendItem(_ item: Item)
    func fetchItems() -> [Item]
    func removeItem(_ item: Item)
}
