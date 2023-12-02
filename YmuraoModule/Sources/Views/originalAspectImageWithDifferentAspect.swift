import SwiftUI

/// 画像の元のアスペクト比を保ったまま、Viewのアスペクト比を変えるView
var originalAspectImageWithDifferentAspect: some View {
    Color.orange
        .aspectRatio(2, contentMode: .fit)
        .overlay {
            Image(systemName: "star")
                .resizable()
                .scaledToFill()
        }
        .clipShape(RoundedRectangle(cornerRadius: 4))
}

#Preview {
    ContentView {
        originalAspectImageWithDifferentAspect
    }
}
