import SwiftUI

struct ContentView: View {
    @State private var showingInspector = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("Main Content Goes Here!")
                    .font(.largeTitle)
            }
            .padding()
            .toolbar {
                Spacer()
                Button {
                    showingInspector.toggle()
                } label: {
                    Label("Toggle Inspector", systemImage: "info.circle")
                }
            }
            .inspector(isPresented: $showingInspector) {
                Inspector()
                    .ignoresSafeArea(edges: [.bottom])
                    .presentationDetents([.medium])
            }
        }
    }
}

struct Inspector: View {
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.2)
            VStack {
                Text("My Inspector")
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ContentView()
}
