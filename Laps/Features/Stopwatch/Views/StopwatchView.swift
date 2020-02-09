import SwiftUI
import Combine

struct StopwatchView: View {
    @ObservedObject var viewModel: StopwatchViewModel
    var timeComponentMinWidth: CGFloat = 70
    var separatorMinWidth: CGFloat = 5
    var fontSize: CGFloat = 50

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack(alignment: .center, spacing: 1) {
                TimeComponentView(minWidth: timeComponentMinWidth, text: self.viewModel.hoursText, fontSize: fontSize)
                TimeComponentView(minWidth: separatorMinWidth, text: ":", fontSize: fontSize)
                TimeComponentView(minWidth: timeComponentMinWidth, text: self.viewModel.minutesText, fontSize: fontSize)
                TimeComponentView(minWidth: separatorMinWidth, text: ":", fontSize: fontSize)
                TimeComponentView(minWidth: timeComponentMinWidth, text: self.viewModel.secondsText, fontSize: fontSize)
                TimeComponentView(minWidth: separatorMinWidth, text: ",", fontSize: fontSize)
                TimeComponentView(minWidth: timeComponentMinWidth, text: self.viewModel.fractionsText, fontSize: fontSize)
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
