//
//  Viewable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol Viewable: ViewableProxy, ViewUpdateDecidable {
    func stylize()
    func layout()
    func activateChildren(parentViewUpdateSet set: ViewUpdateSet)
    
    func activate(viewUpdateSet set: ViewUpdateSet)
    func view() -> UIView
}

extension Viewable {
    public func proxy() -> Viewable {
        return self
    }
}

extension Viewable {
    public func activate(viewUpdateSet set: ViewUpdateSet) {
        if set.style {
            stylize()
        }
        if set.layout {
            layout()
        }
        if set.activateChildren {
            activateChildren(parentViewUpdateSet: set)
        }
    }
}
