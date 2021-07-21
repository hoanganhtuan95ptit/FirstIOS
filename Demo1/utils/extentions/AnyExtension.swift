//
// Created by Hoang Anh Tuan on 21/07/2021.
//

import Foundation


extension NSObject {
    func apply<T>(action: (T) -> ()) -> T {
        let data = self as! T

        action(data)

        return data
    }
}