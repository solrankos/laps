import Foundation

extension DateFormatter  {
    func formatForStopwatchDisplay(components: DateComponents?) -> String? {
        guard let components = components else { return nil }
        guard let date = Calendar.current.date(from: components) else { return nil }
        self.calendar = Calendar.current
        self.dateFormat = "mm:ss,SS"
        return self.string(from: date)
    }
}
