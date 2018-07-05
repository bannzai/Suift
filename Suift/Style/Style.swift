//
//  Style.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit

public protocol Style {
    init()
}

public extension Style {
    public init(closure: (inout Self) -> Void) {
        self.init()
        closure(&self)
    }
}
