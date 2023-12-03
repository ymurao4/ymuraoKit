import SwiftUI

public struct InteractiveStickyHeaderScrollView: View {
    @State var offset: CGFloat = .zero
    @State var shouldShowSticky: Bool = true

    public init() {}
    
    public var body: some View {
        NavigationView {
            VStack {
                ScrollViewOffsetReader(offset: $offset) {
                    ForEach(0..<100, id: \.self) { i in
                        Text("\(i)hogehoge")
                    }
                }
                .onChange(of: offset) { old, new in
                    if offset >= 0 {
                        shouldShowSticky = true
                    } else {
                        shouldShowSticky = old <= new
                    }
                }
                /// under iOS16
                /*
                 .onChange(of: offset) { [offset] newValue in
                    if newValue >= 0 {
                        shouldShowSticky = true
                    } else {
                        shouldShowSticky = offset <= newValue
                    }
                }
                 */
                .safeAreaInset(edge: .top) {
                    stickyView
                }
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
            .background(Color.white)
            .offset(y: shouldShowSticky ? 0 : -40)
            .opacity(shouldShowSticky ? 1 : 0)
            .animation(.easeIn, value: shouldShowSticky)
    }
}

#Preview {
    InteractiveStickyHeaderScrollView()
}
