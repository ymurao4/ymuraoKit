import SwiftUI

var textStartAtTrailing: some View {
    ScrollViewReader { proxy in
        ScrollView(.horizontal, showsIndicators: false) {
            Text("長いテキスト>長いテキスト>長いテキスト>長いテキスト>長いテキスト>")
                .lineLimit(1)
                .id("scroll")
        }
        .onAppear {
            proxy.scrollTo("scroll", anchor: .trailing)
        }
    }
}

#Preview {
    ContentView {
        textStartAtTrailing
    }
}
