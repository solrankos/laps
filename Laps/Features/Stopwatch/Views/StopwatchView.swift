import SwiftUI
import Combine

struct StopwatchView: View {
    @ObservedObject var viewModel: StopwatchViewModel

    var body: some View {
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
    }
}
