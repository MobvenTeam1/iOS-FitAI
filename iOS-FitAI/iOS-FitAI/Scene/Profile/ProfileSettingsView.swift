import SwiftUI

struct ProfileSettingsView: View {
    var zStackFrame: (CGFloat, CGFloat)
    var headerText: String
    var imageNameArray: [String]
    var textArray: [String]
    var toggleIndices: Set<Int>?
    var isOpenOrClosed: [String]?
    @State private var toggleStates: [Bool] = [false,false,false]
    
    var body: some View {
        Text(headerText)
            .font(.system(size: 18))
            .fontWeight(.semibold)
            .foregroundStyle(Color.black84_84)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 54)
            .padding(.bottom, -12)
        ZStack {
            Color.white.ignoresSafeArea()
                .frame(width: zStackFrame.0, height: zStackFrame.1)
                .cornerRadius(12)
                .shadow(color: .gray.opacity(0.2), radius: 12, x: 1, y: 1)
            VStack {
                ForEach(0..<imageNameArray.count, id: \.self) { index in
                    HStack {
                        Image(imageNameArray[index])
                            .resizable()
                            .frame(width: 36, height: 36)
                        Text(textArray[index])
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.black11_11)
                        Spacer()
                        if let toggleIndices = toggleIndices, toggleIndices.contains(index) {
                            Toggle("", isOn: $toggleStates[index])
                                .labelsHidden()
                        } else {
                            Text(isOpenOrClosed?[index] ?? "")
                                .font(.system(size: 14))
                                .foregroundStyle(Color.gray150_150)
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color.gray150_150)
                        }
                    }
                    Color.white247_248
                        .frame(width: 287, height: 1)
                }
            }
            .padding(.horizontal, 20)
            
        }
        .frame(width: zStackFrame.0, height: zStackFrame.1)
    }
}
