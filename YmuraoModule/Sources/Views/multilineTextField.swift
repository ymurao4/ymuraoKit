import SwiftUI

struct TextEditorView: View {
    @State private var text: String?
    @State private var textEditorHeight : CGFloat = 20
    private let placeholder: String = "Enter Text Here"
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollViewReader { reader in
                    ScrollView {
                        VStack {
                            Text("hogehoge")
                            ZStack(alignment: .leading) {
                                Text(text ?? placeholder)
                                    .font(.system(.body))
                                    .foregroundColor(.clear)
                                    .padding(14)
                                    .frame(height: max(40, geometry.size.height - 32))
                                    .opacity(text == nil ? 1 : 0)
                                    .background(
                                        GeometryReader {
                                            Color.clear.preference(
                                                key: ViewHeightKey.self,
                                                value: $0.frame(in: .local).size.height
                                            )
                                        }
                                    )
                                TextEditor(text: Binding($text, replacingNilWith: ""))
                                    .font(.system(.body))
                                    .frame(height: max(40, geometry.size.height - 32))
                                    .cornerRadius(10.0)
                                    .shadow(radius: 1.0)
                                    .padding()
                                    .id("textEditor")
                                    .focused($isFocused)
                            }
                            .padding(.horizontal, 32)
                            .onPreferenceChange(ViewHeightKey.self) {
                                textEditorHeight = $0
                            }
                            .onChange(of: text) {
                                reader.scrollTo("textEditor", anchor: .bottom)
                            }
                        }
                    }
                }
            }
            .navigationTitle("TextEditor")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button(action: {
                        isFocused = false
                    }, label: {
                        Image(systemName: "star")
                    })
                }
            }
        }
    }
}


struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value + nextValue()
    }
}

#Preview {
    TextEditorView()
}

extension Binding where Value: Equatable {
    init(_ source: Binding<Value?>, replacingNilWith nilProxy: Value) {
        self.init(
            get: { source.wrappedValue ?? nilProxy },
            set: { newValue in
                if newValue == nilProxy {
                    source.wrappedValue = nil
                } else {
                    source.wrappedValue = newValue
                }
            }
        )
    }
}
