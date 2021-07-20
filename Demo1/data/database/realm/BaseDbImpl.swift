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
    
    associatedtype R : RealmMapper, Object
    
    func toRealmObjects(entities:[E]) -> [R]
    
    func toRealmObject(entity:E) -> R
    
    func toEntities(realmObjects:Results<R>) -> [E]
    
    func toEntity(realmObject:R) -> E
    
    func getRealmType()-> R.Type
    
}

extension BaseDbImpl{
    
    
    public func saveOrUpdate(entities: [E]) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(toRealmObjects(entities: entities))
        }
    }
    
    public func getAll() -> [E] {
        let realm = try! Realm()
        
        return toEntities(realmObjects:  realm.objects(getRealmType()))
    }
    
    public func getAllSync() -> Observable<[E]> {
        return Observable<[E]>.create { observer in
            let realm = try! Realm()
            
            let token = realm.objects(getRealmType()). { change in
                
            }
            
            return Disposables.create {
                token.invalidate()
            }
        }
    }
}

