//
// Created by Hoang Anh Tuan on 20/07/2021.
//

import Foundation
import RxSwift


public protocol BaseRepository{

    associatedtype E

    func getAllSync() -> Observable<Array<E>>
}
