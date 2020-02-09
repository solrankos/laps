import Foundation
import Combine

struct Lap: Identifiable {
    let id = UUID()
    let text: String
}

class StopwatchViewModel: ObservableObject {
    private var subscribers: [AnyCancellable?] = []
    private let stopwatch = Stopwatch()
    private let formatter = DateFormatter()

    @Published var startButtonText: String = ""
    @Published var lapButtonText: String = ""
    @Published var timeLabelText: String = ""
    @Published var laps: [Lap] = []

    init() {
        subscribers.append(stopwatch.$elapsedTimeDateComponents.sink { [weak self] components in
            if let text = self?.formatter.formatForStopwatchDisplay(components: components) {
                self?.timeLabelText = text
            } else {
                self?.timeLabelText = "00:00,00"
            }
        })
        subscribers.append(stopwatch.$isRunning.sink { [weak self] isRunning in
            self?.startButtonText = isRunning ? "Stop" : "Start"
            self?.lapButtonText = isRunning ? "Varv" : "Nollställ"
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
            saveLap()
        } else {
            stopwatch.reset()
            laps = []
        }
    }

    private func saveLap() {
        if let text = formatter.formatForStopwatchDisplay(components: stopwatch.elapsedTimeDateComponents) {
            self.laps.append(Lap(text: text))
        }
    }
}


