//
//  ViewUpdateDecidable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/06.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public typealias ViewUpdateSet = (style: Bool, layout: Bool, activateChildren: Bool)

public protocol ViewUpdateDecidable {
    func shouldUpdateStyle() -> Bool
    func shouldUpdateLayout() -> Bool
    func shouldUpdateActivateChildren() -> Bool
}

extension ViewUpdateDecidable {
    public func shouldUpdateStyle() -> Bool {
        return true
    }
    public func shouldUpdateLayout() -> Bool {
        return true
    }
    public func shouldUpdateActivateChildren() -> Bool {
        return true
    }
}

internal extension ViewUpdateDecidable {
    // For first rendering
    func allEnabledViewUpdateSet() -> ViewUpdateSet {
        return (style: true, layout: true, activateChildren: true)
    }
    
    func viewUpdateSet() -> ViewUpdateSet {
        return (style: shouldUpdateStyle(), layout: shouldUpdateLayout(), activateChildren: shouldUpdateActivateChildren())
    }
}

internal extension ViewUpdateDecidable {
    func mixViewUpdateStatus(parent: ViewUpdateSet) -> ViewUpdateSet {
        let set = viewUpdateSet()
        return (
            style: parent.style && set.style,
            layout: parent.style && set.layout,
            activateChildren: parent.activateChildren && set.activateChildren
        )
    }
}
