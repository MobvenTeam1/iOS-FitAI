import SwiftUI

struct TrainingPlannedSubView: View {
    @Binding var isTrainingTapped: Bool
    let typeOfExercise: String
    let duration: String
    let calories: String
    var body: some View {
        VStack {
            Text("Kişiselleştirilmiş Antrenman Planı")
                .font(.urbanistBold(size: 18))
                .foregroundStyle(Color.black11_11)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 33)
                .padding(.top, 22)
            Button(action: { isTrainingTapped.toggle() }) {
                ZStack {
                        Image("pilatesbackground")
                    HStack {
                        Text(typeOfExercise)
                            .foregroundStyle(.white)
                            .font(.urbanistBold(size: 24))
                        Spacer()
                        Image(systemName: isTrainingTapped ? "chevron.up" : "chevron.down")
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 38)
                    .offset(y: -16)
                    HStack {
                        Image("clock")
                            .padding(.trailing, -4)
                        Text(duration)
                        Image("calories")
                            .padding(.trailing, -4)
                        Text(calories)
                    }
                    .foregroundStyle(.white)
                    .font(.urbanistRegular(size: 16))
                    .offset(x: -54, y: 20)
                }
                .frame(width: 327, height: 102)
            }
            if isTrainingTapped {
                TrainingPlannedView()
            }
        }
    }
}

#Preview {
    HomePageView()
}
