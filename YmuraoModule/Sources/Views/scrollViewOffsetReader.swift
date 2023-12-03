import SwiftUI

struct ScrollViewOffsetReader<Content: View>: View {
    @Binding var offset: CGFloat
    let content: () -> Content
    private let scrollViewCoordinateSpace: String = "scrollViewCoordinateSpace"
    
    init(
        offset: Binding<CGFloat>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._offset = offset
        self.content = content
    }
    
    var body: some View {
        ScrollView {
            offsetReader
            content()
                .padding(.top, -8)
        }
        .coordinateSpace(name: scrollViewCoordinateSpace)
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) {
            self.offset = $0
        }
    }
    
    private var offsetReader: some View {
        GeometryReader { proxy in
            Color.clear
                .preference (
                    key: ScrollViewOffsetPreferenceKey.self,
                    value: proxy.frame(in: .named(scrollViewCoordinateSpace)).minY
                )
        }
        .frame (height: 0)
    }
}

fileprivate struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}


#Preview {
    @State var offset: CGFloat = .zero
    return VStack {
        Text("Sticky VIew")
            .padding()
            .border(Color.black)
            .offset(y: offset > 0 ? -offset : 0)
        ScrollViewOffsetReader(offset: $offset) {
            ForEach(0..<100, id: \.self) { _ in
                Text("hogehoge")
            }
        }
    }
}
