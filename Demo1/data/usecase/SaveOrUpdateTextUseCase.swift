//
// Created by Hoang Anh Tuan on 21/07/2021.
//

import Foundation

class SaveOrUpdateTextUseCase: BaseUseCase {

    typealias P = Param

    typealias R = Void

    func execute(param: Param) -> Void {
        let text = Text()
        text.name = param.text

        var list = Array<Text>()
        list.append(text)

        DatabaseModule.textDb.saveOrUpdate(entities: list)
    }

    class Param {
        var text: String = ""

        init(text: String) {
            self.text = text
        }
    }
}