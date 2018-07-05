//
//  View.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/02.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public struct ViewStyle: Style {
    public var backgroundColor: Colorable?
    
    public init() { }
    public func apply(with view: UIView) {
        view.backgroundColor = backgroundColor?.color
    }
}

public struct View<V: UIView>: ViewStructurable {
    let _view: V
    
    public let style: ViewStyle // FIXME: move to Viewable
    public let constraint: LayoutMaker
    public var children: [ViewableProxy]
    
    public init(
        view: V? = nil,
        style: ViewStyle,
        constraint: LayoutMaker,
        children: [ViewableProxy] = []
        ) {
        if let view = view {
            self._view = view
        } else {
            self._view = V()
        }
        self.style = style
        self.constraint = constraint
        self.children = children
    }
    
    // FIXME: move to Viewable
    public func stylize() {
        let view = self.view()
        style.apply(with: view)
    }

    public func view() -> UIView {
        return _view
    }
}
