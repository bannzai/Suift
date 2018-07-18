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

extension ViewStyle: SuiftEquatable {
    public static func == (lhs: ViewStyle, rhs: ViewStyle) -> Bool {
        return OptoinalEqual.isEqual(lhs.backgroundColor, rhs.backgroundColor)
    }
}

public struct View<V: UIView>: Rootable {
    let _view: V
    
    public let style: ViewStyle // FIXME: move to Viewable
    public let constraint: LayoutMaker
    public var children: [ViewChildable]
    
    public init(
        view: V? = nil,
        style: ViewStyle,
        constraint: LayoutMaker,
        children: [ViewChildable] = []
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
    public func stylize(for view: UIView) {
        style.apply(with: view)
    }

    public func view() -> UIView {
        return _view
    }
}
