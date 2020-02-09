import UIKit

class Appearance {
    static func setup() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
}
