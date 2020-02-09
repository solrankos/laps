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
                    HStack{
                        Image(systemName: self.viewModel.startButtonImageName).resizable().frame(width: 20.0, height: 20.0)

                        Text(self.viewModel.startButtonText)
                        .fontWeight(.semibold)
                        .font(.title)
                    }
                }
                .padding()
                .background(self.viewModel.startButtonColor)
                .cornerRadius(40)
                .foregroundColor(Color.white)

                Button(action: {
                    self.viewModel.lapButtonAction()
                }) {
                    HStack{
                    Image(systemName: self.viewModel.lapButtonImageName).resizable().frame(width: 20.0, height: 20.0)

                    Text(self.viewModel.lapButtonText)
                    .fontWeight(.semibold)
                    .font(.title)
                    }
                }
                .padding()
                .background(Color.black)
                .cornerRadius(40)
                .foregroundColor(Color.white)
                
            }
        }
    }
}
