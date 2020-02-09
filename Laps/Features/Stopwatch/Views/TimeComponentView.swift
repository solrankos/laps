import SwiftUI

struct TimeComponentView: View {
    var minWidth: CGFloat
    var text: String
    var fontSize: CGFloat

    var body: some View {
        Text(text)
            .frame(minWidth: minWidth)
            .font(.system(size: fontSize))
    }
}
