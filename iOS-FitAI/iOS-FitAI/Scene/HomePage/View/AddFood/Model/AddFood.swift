import Foundation

struct AddFood: Identifiable {
    let id = UUID()
    let name: String
    let secondaryText: String
    let imageName: String?
}

extension AddFood {
    static let sampleFoods = [
        AddFood(name: "Haşlama Yumurta", secondaryText: "2 tane, 180 kcal", imageName: "yumurta"),
        AddFood(name: "Avokado", secondaryText: "Yarım, 220 kcal", imageName: "avokado"),
        AddFood(name: "Ezine Peyniri", secondaryText: "1 porsiyon, 100 kcal", imageName: "ezinepeyniri"),
        AddFood(name: "Domates", secondaryText: "1 tane, 40 kcal", imageName: ""),
        AddFood(name: "Tam Buğday Ekmeği", secondaryText: "1 dilim 75 kcal", imageName: "")
    ]
}
