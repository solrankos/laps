import Foundation
import Combine

class Stopwatch: ObservableObject {
    @Published private(set) var isRunning: Bool = false
    @Published private(set) var time = Time.zero

    private var timer = Timer()

    func start() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isRunning = true
    }

    func stop() {
        timer.invalidate()
        isRunning = false
    }

    func reset() {
        if isRunning == false {
            time = Time.zero
        }
    }

    @objc private func updateTimer() {
        time.fractions += 1

        if time.fractions > 99 {
            time.seconds += 1
            time.fractions = 0
        }

        if time.seconds > 60 {
            time.minutes += 1
            time.seconds = 0
        }

        if time.minutes > 60 {
            time.hours += 1
            time.minutes = 0
        }
    }
}
