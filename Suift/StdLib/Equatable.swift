//
//  Equtable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/06.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public typealias SuiftEquatable = WrapperForEquatable & Equatable

public protocol WrapperForEquatable {
    func _isEqual(compare: Any) -> Bool
}

extension WrapperForEquatable where Self: Equatable {
    public func _isEqual(compare: Any) -> Bool {
        return isEqual(compare: compare as! Self)
    }
    
    public func isEqual(compare: Self) -> Bool {
        return self == compare
    }
}

// FIXME: 1. Cannot used this function
//    func isEqualForOptional<T>(lhs: T?, rhs: T?) -> Bool where T: WrapperForEquatable {
//        return lhs.isEqualForOptional(compare: rhs)
//    }

// FIXME: 2. Cannot declear with generics
//struct OptoinalEqual<T: WrapperForEquatable> {

// FIXME: 3. Cannot use this extension... fmmm
//extension Optional: WrapperForEquatable where Wrapped: WrapperForEquatable {
//    public func _isEqual(compare: Any) -> Bool {
//        return isEqualForOptional(compare: compare as? Wrapped)
//    }
//
//    internal func isEqualForNotOptional(compare: Wrapped) -> Bool {
//        return isEqualForOptional(compare: Optional(compare))
//    }
//
//    internal func isEqualForOptional(compare: Optional<Wrapped>) -> Bool {
//        switch (self, compare) {
//        case (let lhs?, let rhs?):
//            return lhs._isEqual(compare: rhs)
//        case (nil, nil):
//            return true
//        case (_, nil):
//            return false
//        case (nil, _):
//            return false
//        }
//    }
//}

// For compare to optional
struct OptoinalEqual<T> {
    static func isEqual(_ lhs: T, _ rhs: T) -> Bool {
        let optional1 = lhs as? WrapperForEquatable
        let optional2 = rhs as? WrapperForEquatable
        
        switch (optional1, optional2) {
        case (let lhs?, let rhs?):
            return lhs._isEqual(compare: rhs)
        case (nil, nil):
            return true
        case (_, nil):
            return false
        case (nil, _):
            return false
        }
    }
}
