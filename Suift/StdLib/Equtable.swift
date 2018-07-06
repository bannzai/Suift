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
    func isEqual<T>(compare: T) -> Bool
}

extension WrapperForEquatable where Self: Equatable {
    public func isEqual<T>(compare: T) -> Bool {
        return _isEqual(compare: compare as! Self)
    }
    
    public func _isEqual(compare: Self) -> Bool {
        return self == compare
    }
}
