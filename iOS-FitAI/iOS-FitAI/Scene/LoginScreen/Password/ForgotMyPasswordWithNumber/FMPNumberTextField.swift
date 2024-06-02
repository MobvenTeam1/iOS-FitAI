import SwiftUI

struct FMPNumberTextField: View {
    @EnvironmentObject var gsmNumber: GSMNumber
    var body: some View {
        TextField("", text: $gsmNumber.number)
            .placeholder(when: gsmNumber.number.isEmpty, placeholder: {
                Text("Number")
            })
            .keyboardType(.numberPad)
            .padding(.leading, 18)
            .frame(width: 327, height: 56)
            .background(Color.white247_248)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray232_232)
            )
            .padding(.top, 32)
    }
}

#Preview {
    FMPNumberTextField()
}
