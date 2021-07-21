//
// Created by Hoang Anh Tuan on 20/07/2021.
//

import Foundation
import RxSwift

class HomeViewModel {

    let findAllTextSyncUseCase = FindAllTextSyncUseCase()

    let textList: Observable<Array<TextViewItem>>

    init() {
        textList = findAllTextSyncUseCase.execute(param: FindAllTextSyncUseCase.Param()).map {
            $0.map {
                TextViewItem(text: $0).apply {
                    $0.refresh()
                }
            }
        }
    }

}
