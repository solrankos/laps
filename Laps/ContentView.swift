import SwiftUI
import Combine

class StopWatchViewModel: ObservableObject {
    private var isRunning: Bool = false {
        willSet {
            objectWillChange.send()
        }
    }

    private var currentTime: Float = 0 {
        willSet {
            objectWillChange.send()
        }
    }

    let objectWillChange = PassthroughSubject<Void, Never>()

    var startButtonText: String {
        return isRunning ? "Stop" : "Start"
    }

    var lapButtonText: String {
        return isRunning ? "Lap" : "Reset"
    }

    var timeLabelText: String {
        return "\(currentTime)"
    }

    func startButtonAction() {
        if isRunning {
            stop()
        } else {
            start()
        }

        isRunning = !isRunning
    }

    func lapButtonAction() {
        if isRunning {
            saveLap()
        } else {
            reset()
        }
    }

    private func start() {
        print("starting")
        currentTime = 100
    }

    private func stop() {
        print("stopping")
    }

    private func saveLap() {
        print("saving lap")
    }

    private func reset() {
        print("reseting")
        currentTime = 0
    }
}

struct ContentView: View {
    @ObservedObject var stopWatchViewModel = StopWatchViewModel()

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
