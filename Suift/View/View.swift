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

public struct View<V: UIView>: Viewable {
    let _view = V()
    
    let style: ViewStyle
    let constraint: LayoutMaker
    let children: [Viewable]
    
    public init(
        style: ViewStyle,
        constraint: LayoutMaker,
        children: [Viewable] = []
        ) {
        self.style = style
        self.constraint = constraint
        self.children = children
    }
    
    public func stylize() {
        style.apply(with: _view)
    }
    
    public func layout() {
        let set: ViewSetForLayout = (_view, _view.superview!, _view.superview!.subviews)
        let layouts = constraint.layouts(set)
        _view.translatesAutoresizingMaskIntoConstraints = layouts.isEmpty
        NSLayoutConstraint.activate( layouts.layout(set: set) )
    }
    
    public func activateChildren() {
        children
            .forEach {
                let view = $0.view()
                _view.addSubview(view)
                $0.activate()
        }
    }

    public func view() -> UIView {
        return _view
    }
}
