import Foundation

struct Time {
    var hours: Int
    var minutes: Int
    var seconds: Int
    var fractions: Int

    static var zero: Time {
        return Time(hours: 0, minutes: 0, seconds: 0, fractions: 0)
    }
}
