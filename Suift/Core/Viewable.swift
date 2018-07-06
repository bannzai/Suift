//
//  Viewable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol Viewable: ViewableProxy {
    func stylize()
    func layout()
    func activateChildren()
    
    func activate(for view: UIView)
    func view() -> UIView
}

extension Viewable {
    public func proxy() -> Viewable {
        return self
    }
}

extension Viewable {
    public func activate(for view: UIView) {
        stylize()
        if view.constraints.isEmpty {
            layout()
        }
        activateChildren()
    }
}
