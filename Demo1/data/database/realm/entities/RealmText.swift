//
//  Text.swift
//  Demo1
//
//  Created by Hoang Anh Tuan on 19/07/2021.
//

import Foundation
import RealmSwift

public class RealmText: Object, RealmMapper {
    
    public typealias E = Text
    public typealias R = RealmText
    
    @objc dynamic var name = ""

    public func copy(entity: Text) -> RealmText {
        let realm = RealmText()
        realm.name = entity.name
        return realm
    }
    
    public func convert() -> Text {
        let entity = Text()
        entity.name = name
        return entity
    }
}
