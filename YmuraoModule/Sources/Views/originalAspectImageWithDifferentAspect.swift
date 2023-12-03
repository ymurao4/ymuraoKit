import SwiftUI

/// 画像の元のアスペクト比を保ったまま、Viewのアスペクト比を変えるView
struct OriginalAspectImageWithDifferentAspect: View {
    var body: some View {
        Color.orange
            .aspectRatio(2, contentMode: .fit)
            .overlay {
                Image(systemName: "star")
                    .resizable()
                    .scaledToFill()
            }
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    OriginalAspectImageWithDifferentAspect()
}
