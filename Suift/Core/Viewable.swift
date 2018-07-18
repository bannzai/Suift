//
//  Viewable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol Viewable: ViewUpdateDecidable {
    func view() -> UIView
}

// MARK: - ViewActivatableProxy
extension Viewable where Self: ViewActivatable {
    public func viewActivatable() -> ViewActivatable {
        return self
    }
}
