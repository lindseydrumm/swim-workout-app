import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello")
                .font(.title)
            Text("World")
                .font(.subheadline)
            Divider()
            Text("This is a demo app")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .frame(alignment: .center)
            Spacer()
            Image("map")
                .resizable()
                .scaledToFit()
                .frame(height: 300)
        }
        .padding()
    }

}
