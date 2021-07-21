//
//  TextDbImpl.swift
//  Demo1
//
//  Created by Hoang Anh Tuan on 19/07/2021.
//

import Foundation

public class TextDbImpl: BaseDbImpl, TextDb {

    public typealias E = Text

    public typealias R = RealmText

    public func toRealmObject(entity: Text) -> RealmText {
        return RealmText().copy(entity: entity)
    }

    public func toEntity(realmObject: RealmText) -> Text {
        return realmObject.convert()
    }

    public func getRealmType() -> RealmText.Type {
        return RealmText.self
    }
}

