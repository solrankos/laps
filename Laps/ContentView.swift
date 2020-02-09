import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var stopWatchViewModel = StopwatchViewModel()

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(self.stopWatchViewModel.timeLabelText)

            Button(action: {
                self.stopWatchViewModel.startButtonAction()
            }) {
                Text(self.stopWatchViewModel.startButtonText)
            }
            
            Button(action: {
                self.stopWatchViewModel.lapButtonAction()
            }) {
                Text(self.stopWatchViewModel.lapButtonText)
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
