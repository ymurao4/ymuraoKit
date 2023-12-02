import SwiftUI

public struct ContentView<Content: View>: View {
    let content: () -> Content
    
    public init(content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        content()
            .padding()
    }
}

#Preview {
    ContentView {
        Text("hoge")
    }
}
