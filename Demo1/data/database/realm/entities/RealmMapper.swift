//
//  RealmMapper.swift
//  Demo1
//
//  Created by Hoang Anh Tuan on 19/07/2021.
//

import Foundation

public protocol RealmMapper {

    associatedtype R
    associatedtype E
    
    func copy(entity : E) -> R
    
    func convert() -> E
}
