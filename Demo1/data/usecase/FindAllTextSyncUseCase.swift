//
// Created by Hoang Anh Tuan on 20/07/2021.
//

import Foundation
import RxSwift

public class FindAllTextSyncUseCase: BaseUseCase {

    public typealias P = Param
    public typealias R = Observable<Array<Text>>

    public func execute(param: Param) -> Observable<Array<Text>> {
        DatabaseModule.textDb.getAllSync().map { array -> Array<Text> in
            var list = array

            list.reverse()

            return list
        }
    }

    public class Param {

    }
}
