import Foundation
import Combine
import SwiftUI

class StopwatchViewModel: ObservableObject {
    private var subscribers: [AnyCancellable?] = []
    private let stopwatch = Stopwatch()

    @Published var hoursText: String = ""
    @Published var minutesText: String = ""
    @Published var secondsText: String = ""
    @Published var fractionsText: String = ""

    @Published var startButtonText: String = ""
    @Published var startButtonColor: Color = .green
    @Published var startButtonImageName: String = ""

    @Published var lapButtonText: String = ""
    @Published var lapButtonImageName: String = ""

    @Published var laps: [Lap] = []

    init() {
        subscribers.append(stopwatch.$time.sink { [weak self] time in
            self?.hoursText = time.hours.leadingZeroString
            self?.minutesText = time.minutes.leadingZeroString
            self?.secondsText = time.seconds.leadingZeroString
            self?.fractionsText = time.fractions.leadingZeroString
        })
        subscribers.append(stopwatch.$isRunning.sink { [weak self] isRunning in
            self?.startButtonText = isRunning ? "Stop" : "Start"
            self?.startButtonColor = isRunning ? .red : .green
            self?.startButtonImageName = isRunning ? "stop.circle" : "stopwatch"


            self?.lapButtonText = isRunning ? "Varv" : "Nollställ"
            self?.lapButtonImageName = isRunning ? "flag" : "xmark.circle"
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
        self.laps.append(Lap(time: stopwatch.time))
    }
}
