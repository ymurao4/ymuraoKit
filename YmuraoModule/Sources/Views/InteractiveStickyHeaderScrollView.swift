import SwiftUI

public struct InteractiveStickyHeaderScrollView: View {
    @State var offset: CGFloat = .zero
    @State var shouldShowStickyView: Bool = true
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            ScrollViewOffsetReader(offset: $offset) {
                ForEach(0...100, id: \.self) { i in
                    cell(i)
                }
            }
            .onChange(of: offset) { oldValue, newValue in
                if offset >= 0 {
                    shouldShowStickyView = true
                } else {
                    shouldShowStickyView = oldValue <= newValue
                }
            }
            /// under iOS16
            /*
            .onChange(of: offset) { [offset] newValue in
                if newValue >= 0 {
                    shouldShowStickyView = true
                } else {
                    shouldShowStickyView = offset <= newValue
                }
            }
            */
            .safeAreaInset(edge: .top, spacing: 0) {
                stickyView
            }
            .navigationTitle("hoge")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var stickyView: some View {
        Text("Sticky View")
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 40)
            .background(Color.orange)
            .offset(y: shouldShowStickyView ? 0 : -40)
            .opacity(shouldShowStickyView ? 1 : 0)
            .animation(.easeIn, value: shouldShowStickyView)
    }
    
    func cell(_ i: Int) -> some View {
        Text("\(i)：hogehoge")
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    InteractiveStickyHeaderScrollView()
}
