//
//  SwiftDataViewModel.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 9.06.2024.
//

import SwiftUI

 class SwiftDataViewModel<Item, DataSource>: ObservableObject where DataSource: DataSourceProtocol, DataSource.Item == Item {
    @Published var items: [Item] = []
    private var dataSource: DataSource
    
    init(dataSource: DataSource) {
        self.dataSource = dataSource
        fetchItems()
    }
    
    func appendItem(_ item: Item) {
        dataSource.appendItem(item)
        fetchItems()
    }
    
    func removeItem(at index: Int) {
        let item = items[index]
        dataSource.removeItem(item)
        fetchItems()
    }
    
    func fetchItems() {
        items = dataSource.fetchItems()
    }
}

