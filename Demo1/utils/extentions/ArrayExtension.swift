//
// Created by Hoang Anh Tuan on 20/07/2021.
//

import Foundation


extension Array {

    func map<T>(action: (Element) -> T) -> Array<T> {
        var array = Array<T>()
        for item in self {
            array.append(action(item))
        }
        return array
    }
}