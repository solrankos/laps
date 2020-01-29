import SwiftUI
import Combine

extension Date {
    var elapsedTime: String {
        let components = Calendar.current.dateComponents([.minute, .second, .nanosecond], from: self, to: Date())
        let date =  Calendar.current.date(from: components)!

        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar.current
        dateFormatter.dateFormat = "mm:ss,SS"

        return dateFormatter.string(from: date)
    }
}

class StopWatchViewModel: ObservableObject {
    private var isRunning: Bool = false {
        willSet {
            objectWillChange.send()
        }
    }

    private var startDate: Date? = nil {
        willSet {
            objectWillChange.send()
        }
    }

    private var timer = Timer()

    let objectWillChange = PassthroughSubject<Void, Never>()

    var startButtonText: String {
        return isRunning ? "Stop" : "Start"
    }

    var lapButtonText: String {
        return isRunning ? "Lap" : "Reset"
    }

    var timeLabelText: String {
        guard let startDate = startDate else {  return "00:00,00" }
        return startDate.elapsedTime
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
        startDate = Date()
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    private func stop() {
        print("stopping")
        timer.invalidate()
    }

    private func saveLap() {
        print("saving lap")
    }

    private func reset() {
        print("reseting")
        startDate = nil
    }

    @objc private func updateTimer() {
        objectWillChange.send()
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
