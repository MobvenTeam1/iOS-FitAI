import SwiftUI

struct MealCategories: View {
     var imageName: [String]
    var actions: [() -> Void]
    var body: some View {
        VStack(spacing: 12) {
            HStack {
            Text("Öğün Kategorileri")
                .font(.urbanistBold(size: 18))
                .foregroundStyle(Color.black29_30)
                .frame(maxWidth: .infinity, alignment: .leading)
                Button {
                    
                }label: {
                    Text("Tümünü Gör")
                        .font(.urbanistSemibold(size: 14))
                        .foregroundStyle(Color.gray150_150)
                        .padding(.trailing, 24)
                }
        }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<imageName.count, id: \.self) { index in
                        Button {
                            self.actions[index]()
                        }label: {
                            Image(imageName[index])
                        }
                    }
                }
            }
        }
        .padding(.top, 24)
        .padding(.leading, 24)
    }
}

#Preview {
    HomePageView()
}
