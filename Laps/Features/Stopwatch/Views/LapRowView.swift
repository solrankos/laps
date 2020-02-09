import SwiftUI

struct LapRowView: View {
    var lap: Lap

    var body: some View {
        HStack(alignment: .center, spacing: 1) {
            Text(lap.time.hours.leadingZeroString)
            Text(":")
            Text(lap.time.minutes.leadingZeroString)
            Text(":")
            Text(lap.time.seconds.leadingZeroString)
            Text(",")
            Text(lap.time.fractions.leadingZeroString)
        }
    }
}
