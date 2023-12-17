import SwiftUI

/// VStackの中にLazyVStackを入れる→Lazyがついている箇所は遅延読み込み
/// LazyVStackの中にLazyVStackを入れる→遅延読み込み
/// LazyVStackの中にVStackを入れる→VStackの範囲が表示されると全部読み込まれる
struct LazyOnApeparView: View {
    var body: some View {
        ScrollView {
            VStack {
                LazyVStack {
                    ForEach(0..<25, id: \.self) { i in
                        CellView(i: i)
                            .onAppear {
                                print("upper:" + String(i))
                            }
                    }
                }
                .background(Color.gray.opacity(0.4))
                LazyVStack {
                    ForEach(25..<50, id: \.self) { i in
                        CellView(i: i)
                            .onAppear {
                                print("middle:" + String(i))
                            }
                    }
                }
                .background(Color.red.opacity(0.4))
                LazyVStack {
                    ForEach(50..<75, id: \.self) { i in
                        CellView(i: i)
                            .onAppear {
                                print("lower:" + String(i))
                            }
                    }
                }
                .background(Color.blue.opacity(0.4))
                Text("表示されたぞ！！！")
                    .onAppear {
                        print("表示されたぞ！！！")
                    }
            }
        }
    }
}

#Preview {
    LazyOnApeparView()
}


struct CellView: View {
    let i: Int

    init(i: Int) {
        self.i = i
    }
    
    var body: some View {
        Text(String(i))
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
