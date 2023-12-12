import SwiftUI

struct AnimatedTextView: View {
    @State private var dotCount = 0
    var dots: String {
        String(repeating: ".", count: dotCount)
    }
    
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack(spacing: 0) {
            Text("購入待ち")
                .font(.title)
                .foregroundStyle(Color.gray)
            Text("...")
                .font(.title)
                .hidden()
                .overlay {
                    Text(dots)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onReceive(timer) { _ in
                            if dotCount < 3 {
                                dotCount += 1
                            } else {
                                dotCount = 1
                            }
                        }
                }
        }
    }
}

#Preview {
    AnimatedTextView()
}
