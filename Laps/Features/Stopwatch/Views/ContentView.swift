import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel = StopwatchViewModel()

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 10) {
                VStack(alignment: .center, spacing: 10) {
                    HStack(alignment: .center, spacing: 1) {
                        Text(self.viewModel.hoursText)
                        Text(":")
                        Text(self.viewModel.minutesText)
                        Text(":")
                        Text(self.viewModel.secondsText)
                        Text(",")
                        Text(self.viewModel.fractionsText)
                    }

                    HStack(alignment: .center, spacing: 10) {
                        Button(action: {
                            self.viewModel.startButtonAction()
                        }) {
                            Text(self.viewModel.startButtonText)
                        }

                        Button(action: {
                            self.viewModel.lapButtonAction()
                        }) {
                            Text(self.viewModel.lapButtonText)
                        }
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 2)

                Divider()

                VStack(alignment: .center, spacing: 10) {
                    List(self.viewModel.laps) { lap in
                        HStack(alignment: .center, spacing: 1) {
                            Text(String(format: "%02d", lap.time.hours))
                            Text(":")
                            Text(String(format: "%02d", lap.time.minutes))
                            Text(":")
                            Text(String(format: "%02d", lap.time.seconds))
                            Text(",")
                            Text(String(format: "%02d", lap.time.fractions))
                        }
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
