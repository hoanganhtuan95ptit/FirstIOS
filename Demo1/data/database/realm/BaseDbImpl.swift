//
//  BaseDbImpl.swift
//  Demo1
//
//  Created by Hoang Anh Tuan on 19/07/2021.
//

import Foundation
import RealmSwift
import RxSwift

public protocol BaseDbImpl: BaseDb {

    associatedtype R: RealmMapper, Object

    func toRealmObject(entity: E) -> R

    func toEntity(realmObject: R) -> E

    func getRealmType() -> R.Type

}

extension BaseDbImpl {

    func toRealmObjects(entities: Array<E>) -> Array<R> {
        var list = Array<R>()
        for item in entities {
            list.append(toRealmObject(entity: item))
        }
        return list
    }

    func toEntities(realmObjects: Results<R>) -> Array<E> {
        var list = Array<E>()
        for item in realmObjects {
            list.append(toEntity(realmObject: item))
        }
        return list
    }

    public func saveOrUpdate(entities: Array<E>) {
        let realm = try! Realm()

        try! realm.write {
            realm.add(toRealmObjects(entities: entities))
        }
    }

    public func getAll() -> Array<E> {
        let realm = try! Realm()

        return toEntities(realmObjects: realm.objects(getRealmType()))
    }

    public func getAllSync() -> Observable<Array<E>> {
        Observable<Array<E>>.create { observer in
            let realm = try! Realm()

            let realmObjects = realm.objects(getRealmType())

            let token = realmObjects.observe { change in
                observer.onNext(toEntities(realmObjects: realmObjects))
            }

            return Disposables.create {
                token.invalidate()
            }
        }.observe(on: MainScheduler.instance)
    }
}

