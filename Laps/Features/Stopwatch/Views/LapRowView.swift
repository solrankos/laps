import SwiftUI

struct LapRowView: View {
    var lap: Lap
    var timeComponentMinWidth: CGFloat = 20
    var separatorMinWidth: CGFloat = 2
    var fontSize: CGFloat = 20

    var body: some View {
        HStack(alignment: .center, spacing: 1) {
            TimeComponentView(minWidth: timeComponentMinWidth, text: lap.time.hours.leadingZeroString, fontSize: fontSize)
            TimeComponentView(minWidth: separatorMinWidth, text: ":", fontSize: fontSize)
            TimeComponentView(minWidth: timeComponentMinWidth, text: lap.time.minutes.leadingZeroString, fontSize: fontSize)
            TimeComponentView(minWidth: separatorMinWidth, text: ":", fontSize: fontSize)
            TimeComponentView(minWidth: timeComponentMinWidth, text: lap.time.minutes.leadingZeroString, fontSize: fontSize)
            TimeComponentView(minWidth: separatorMinWidth, text: ",", fontSize: fontSize)
            TimeComponentView(minWidth: timeComponentMinWidth, text: lap.time.fractions.leadingZeroString, fontSize: fontSize)
        }
    }
}
