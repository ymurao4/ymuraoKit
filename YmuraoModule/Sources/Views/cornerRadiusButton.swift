import SwiftUI

/// 角丸のボタン（塗りつぶし）
struct CornerRadiusButton: View {
    var body: some View {
        Button(action: {}) {
            Text("角丸ボタン")
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .padding(.horizontal, 16)
                .background(Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    CornerRadiusButton()
}
