import SwiftUI

/// 角丸のボタン（塗りつぶしなし）
var strokeView: some View {
    Text("角丸のView")
        .frame(width: 100, height: 100)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.yellow, lineWidth: 1)
        }
}

#Preview {
    ContentView {
        strokeView
    }
}
