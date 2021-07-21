//
// Created by Hoang Anh Tuan on 20/07/2021.
//

import Foundation

class TextViewItem: NSObject {

    let text: Text

    var image: String = ""
    var textStr: String = ""

    init(text: Text) {
        self.text = text
    }

    public func refresh() {
        textStr = text.name
    }
}