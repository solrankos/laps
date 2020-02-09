import Foundation
import Combine

// TODO: unit test
// TODO: make observable
// TODO: add lap logic
// TODO: remove debug prints

class Stopwatch: ObservableObject {
    @Published private(set) var isRunning: Bool = false
    @Published private(set) var elapsedTimeDateComponents: DateComponents? = nil

    public private(set) var startDate: Date? = nil
    private var timer = Timer()

    func start() {
        print("starting")
        self.startDate = Date()
        self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        self.isRunning = true
    }

    func stop() {
        print("stoping")
        self.timer.invalidate()
        self.isRunning = false
    }

    func reset() {
        print("reseting")
        if isRunning == false {
            self.startDate = nil
            elapsedTimeDateComponents = nil
        }
    }

    @objc private func updateTimer() {
        if let startDate = startDate {
            let components = Calendar.current.dateComponents([.minute, .second, .nanosecond], from: startDate, to: Date())
            elapsedTimeDateComponents = components
        }
    }
}
