import SwiftUI

var floatingLikeButton: some View {
    VStack(spacing: 0) {
        Color.orange
            .overlay(alignment: .bottomTrailing) {
                Circle()
                    .fill(Color.white)
                    .frame(width: 40)
                    .overlay {
                        Image(systemName: "heart")
                            .frame(width: 24)
                    }
                    .padding(.trailing, 16)
                    .offset(y: 20)
            }
            .zIndex(1)
        Color.red
    }
}

#Preview {
    ContentView {
        floatingLikeButton
    }
}
