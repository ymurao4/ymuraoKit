import SwiftUI

/// VStackの中にLazyVStackを入れる→Lazyがついている箇所は遅延読み込み
/// LazyVStackの中にLazyVStackを入れる→遅延読み込み
/// LazyVStackの中にVStackを入れる→VStackの範囲が表示されると全部読み込まれる
struct LazyOnApeparView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                LazyVStack {
                    ForEach(0..<50, id: \.self) { i in
                        Text(String(i))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.gray.opacity(0.4))
                            .onAppear {
                                print("upper:" + String(i))
                            }
                    }
                }
                LazyVStack {
                    ForEach(0..<50, id: \.self) { i in
                        Text(String(i))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.red.opacity(0.4))
                            .onAppear {
                                print("middle:" + String(i))
                            }
                    }
                }
                LazyVStack {
                    ForEach(0..<50, id: \.self) { i in
                        Text(String(i))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.blue.opacity(0.4))
                            .onAppear {
                                print("lower:" + String(i))
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    LazyOnApeparView()
}
