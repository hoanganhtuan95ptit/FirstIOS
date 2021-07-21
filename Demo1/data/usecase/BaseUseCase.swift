//
// Created by Hoang Anh Tuan on 20/07/2021.
//

import Foundation

public protocol BaseUseCase {

    associatedtype P

    associatedtype R

    func execute(param: P) -> R
}
