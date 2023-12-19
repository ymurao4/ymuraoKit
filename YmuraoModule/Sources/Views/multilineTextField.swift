import SwiftUI

struct TextFieldParentView: View {
    @FocusState private var focusedTextfield: FocusField?
    @State private var input1 = "Hi"
    @State private var input2 = "Hi2"

    enum FocusField: Hashable {
            case textfield1, textfield2
    }

    var body: some View {
        VStack {
            TextField("", text: $input1)
                .focused($focusedTextfield, equals: .textfield1)
            TextEditorView()
                .focused($focusedTextfield, equals: .textfield2)
        }
        .border(Color.black)
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button {
                    focusedTextfield = nil
                } label: {
                    Image(systemName: "star")
                }
            }
        }
    }
}

struct TextEditorView: View {
    @State private var text: String?
    @State private var textEditorHeight : CGFloat = 20
    private let placeholder: String = "Enter Text Here"
    @FocusState private var isFocused: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { reader in
                ScrollView {
                    LazyVStack {
                        if #available(iOS 16, *) {
                            textField(geometry: geometry)
                                .id("textField")
                        } else {
                            textEditor(geometry: geometry)
                                .id("textField")
                        }
                    }
                }
                .onChange(of: text, { _, _ in
                    reader.scrollTo("textField", anchor: .bottom)
                })
            }
        }
        .navigationTitle("TextEditor")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension TextEditorView {
    func textField(geometry: GeometryProxy) -> some View {
        TextField("Address", text: Binding($text, replacingNilWith: ""), axis: .vertical)
            .focused($isFocused)
            .frame(minHeight: 40)
            .border(Color.black)
            .padding()
    }

    func textEditor(geometry: GeometryProxy) -> some View {
        VStack {
            ZStack(alignment: .leading) {
                Text(text ?? placeholder)
                    .font(.system(.body))
                    .foregroundColor(.clear)
                    .padding(14)
                    .frame(minHeight: 40)
                    .frame(maxHeight: geometry.size.height - 32)
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
                    .frame(minHeight: 40)
                    .frame(maxHeight: geometry.size.height - 32)
                    .cornerRadius(10.0)
                    .shadow(radius: 1.0)
                    .padding()
                    .focused($isFocused)
            }
            .padding(.horizontal, 32)
            .onPreferenceChange(ViewHeightKey.self) {
                textEditorHeight = $0
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
