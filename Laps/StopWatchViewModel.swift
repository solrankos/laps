import Foundation
import Combine

class StopwatchViewModel: ObservableObject {
    private var subscribers: [AnyCancellable?] = []
    private let stopwatch = Stopwatch()
    private let formatter = DateFormatter()

    @Published var startButtonText: String = ""
    @Published var lapButtonText: String = ""
    @Published var timeLabelText: String = ""

    init() {
        subscribers.append(stopwatch.$elapsedTimeDateComponents.sink { components in
            if let text = self.formatter.formatForStopwatchDisplay(components: components) {
                self.timeLabelText = text
            } else {
                self.timeLabelText = "00:00,00"
            }
        })
        subscribers.append(stopwatch.$isRunning.sink { isRunning in
            self.startButtonText = isRunning ? "Stop" : "Start"
            self.lapButtonText = isRunning ? "Varv" : "Nollställ"
        })
    }

    deinit {
        for subscriber in subscribers {
            subscriber?.cancel()
        }
    }

    func startButtonAction() {
        if stopwatch.isRunning {
            stopwatch.stop()
        } else {
            stopwatch.start()
        }
    }

    func lapButtonAction() {
        if stopwatch.isRunning {
            stopwatch.saveLap()
            print(stopwatch.laps)
        } else {
            stopwatch.reset()
        }
    }
}
