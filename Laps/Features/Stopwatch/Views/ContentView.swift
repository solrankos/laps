import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel = StopwatchViewModel()

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 10) {
                VStack(alignment: .center, spacing: 10) {
                    StopwatchView(viewModel: self.viewModel)
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 2)

                Divider()

                VStack(alignment: .center, spacing: 10) {
                    List(self.viewModel.laps) { lap in
                        LapRowView(lap: lap)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
