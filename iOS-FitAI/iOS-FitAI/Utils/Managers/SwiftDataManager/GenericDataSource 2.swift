//
//  GenericDataSource.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 9.06.2024.
//

import SwiftUI
import SwiftData

final class GenericDataSource<Item: PersistentModel >: DataSourceProtocol {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    @MainActor
    init() {
        do {
            self.modelContainer = try ModelContainer(for: Item.self)
        } catch {
            fatalError("Error Model Container: \(error.localizedDescription), error: \(error)")
        }
        self.modelContext = modelContainer.mainContext
    }

    func appendItem(_ item: Item) {
        modelContext.insert(item)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func fetchItems() -> [Item] {
        do {
            return try modelContext.fetch(FetchDescriptor<Item>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func removeItem(_ item: Item) {
            modelContext.delete(item)
            do {
                try modelContext.save()
            } catch {
                fatalError(error.localizedDescription)
            }
        }
}
