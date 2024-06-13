import SwiftData
import Foundation

//@Model
//class AddFood {
//    @Attribute(.unique) var id = UUID()
//    let name: String
//    let secondaryText: String
//    let imageName: String?
//    var isFavorited: Bool = false
//    init(id: UUID = UUID(), name: String, secondaryText: String, imageName: String?, isFavorited: Bool = false) {
//        self.id = id
//        self.name = name
//        self.secondaryText = secondaryText
//        self.imageName = imageName
//        self.isFavorited = isFavorited
//    }
//}

struct AddFood: Identifiable {
    @Attribute(.unique) var id = UUID()
    let name: String
    let secondaryText: String
    let imageName: String?
    var isFavorited: Bool = false
    init(id: UUID = UUID(), name: String, secondaryText: String, imageName: String?, isFavorited: Bool = false) {
        self.id = id
        self.name = name
        self.secondaryText = secondaryText
        self.imageName = imageName
        self.isFavorited = isFavorited
    }
}

extension AddFood {
    static let sampleFoods = [
        AddFood(name: "Haşlama Yumurta", secondaryText: "2 tane, 180 kcal", imageName: "egg"),
        AddFood(name: "Avocado", secondaryText: "Yarım, 220 kcal", imageName: "avocado"),
        AddFood(name: "Ezine Peyniri", secondaryText: "1 porsiyon, 100 kcal", imageName: "ezinepeyniri"),
        AddFood(name: "Domates", secondaryText: "1 tane, 40 kcal", imageName: "tomato"),
        AddFood(name: "Tam Buğday Ekmeği", secondaryText: "1 dilim 75 kcal", imageName: "breed"),
        AddFood(name: "Yulaf", secondaryText: "90 gr (3 Kaşık) 90 kcal", imageName: "oat"),
        AddFood(name: "Frambuaz", secondaryText: "1 Porsiyon, 85 kcal", imageName: "raspberry")
    ]
}

//@MainActor
//final class AddFoodViewModel: SwiftDataViewModel<AddFood, GenericDataSource<AddFood>> {
//    init() {
//        let dataSource = GenericDataSource<AddFood>()
//        super.init(dataSource: dataSource)
//    }
//
//}
