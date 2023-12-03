import SwiftUI

/// 横スクロール可能な長いテキストの初期表示位置を右端にする
struct TextStartAtTrailing: View {
    var body: some View {
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
}

#Preview {
    TextStartAtTrailing()
}
