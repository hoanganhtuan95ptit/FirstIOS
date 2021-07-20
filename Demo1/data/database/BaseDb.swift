//
//  BaseDb.swift
//  Demo1
//
//  Created by Hoang Anh Tuan on 19/07/2021.
//

import Foundation
import RxSwift
import RxFlow

public protocol BaseDb {
    
    associatedtype E
    
    func saveOrUpdate(entities: [E])
    
    func getAll() -> [E]
    
    func getAllSync() -> Observable<[E]>
}

