//
// Created by Hoang Anh Tuan on 20/07/2021.
//

import Foundation
import RxSwift

public class TextRepository : BaseRepository{
    
    public typealias E = Text
    
    public func getAllSync() -> Observable<Array<Text>> {
        let textDb = TextDbImpl()
        
        return textDb.getAllSync()
    }
}
