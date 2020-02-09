import Foundation

extension Int {
    var leadingZeroString: String {
        return String(format: "%02d", self)
    }
}
