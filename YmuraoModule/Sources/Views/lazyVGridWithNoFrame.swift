import SwiftUI

/// frameを使用しないGridView
var lazyVGridWithoutFrameModifier: some View {
    LazyVGrid(
        columns:  .init(repeating: .init(.flexible(), spacing: 0), count: 3)
    ) {
        ForEach(0..<10, id: \.self) { _ in
            Text("GridView")
                .padding()
                .border(Color.orange)
        }
    }
}

#Preview {
    ContentView {
        lazyVGridWithoutFrameModifier
    }
}
