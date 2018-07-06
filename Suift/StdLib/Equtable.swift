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
    func _isEqual<T>(compare: T) -> Bool
}

extension WrapperForEquatable where Self: Equatable {
    public func _isEqual<T>(compare: T) -> Bool {
        return isEqual(compare: compare as! Self)
    }
    
    public func isEqual(compare: Self) -> Bool {
        return self == compare
    }
}
