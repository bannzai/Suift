//
//  Viewable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol Viewable {
    
    func stylize(with style: Style)
    func layout()
    func activateChildren()
    
    func activate()
    func view() -> UIView
}

extension Viewable {
    public func activate() {
        stylize()
        layout()
        activateChildren()
    }
}
