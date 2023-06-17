import SwiftUI

struct ContentView: View {
    @State private var showingInspector = false

    var body: some View {
        NavigationView {
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
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

struct ButtonGroup: View {
    var body: some View {
        ControlGroup {
            Button {
                print("got cut tap")
            } label: {
                Label("Cut", systemImage: "scissors")
            }
            Button {
                print("got copy tap")
            } label: {
                Label("Copy", systemImage: "doc.on.doc")
            }
            Button {
                print("got paste tap")
            } label: {
                Label("Paste", systemImage: "doc.on.doc.fill")
            }
            Button {
                print("got new tap")
            } label: {
                Label("New", systemImage: "plus.square.on.square")
            }
        }
        // Styles include automatic, compactMenu,
        // menu, navigation, and palette.
        // This causes the ControlGroup to not appear!
        // .controlGroupStyle(.compactMenu)
    }
}

struct Inspector: View {
    var body: some View {
        VStack {
            Spacer()
            Text("My Inspector").font(.largeTitle)
            Spacer()
        }
        .toolbar { ButtonGroup() }
        .frame(maxWidth: .infinity)
        .background(.yellow.opacity(0.2))
    }
}

#Preview {
    ContentView()
}
