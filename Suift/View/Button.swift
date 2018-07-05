//
//  Button.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/05.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit

public struct ButtonStyle: Style {
    public var backgroundColor: Colorable?
    
    public init() { }
    public func apply(with view: UIButton) {
        view.backgroundColor = backgroundColor?.color
    }
}

public struct Button<V: UIButton>: Viewable {
    let _view: V
    
    public let style: ButtonStyle
    public let constraint: LayoutMaker
    public var children: [ViewableProxy]
    
    public init(
        view: V? = nil,
        style: ButtonStyle,
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
    
    public func stylize() {
        let view = self.view() as! V
        style.apply(with: view)
    }

    public func view() -> UIView {
        return _view
    }
}
