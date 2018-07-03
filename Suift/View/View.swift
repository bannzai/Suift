//
//  View.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/02.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public struct ViewStyle {
    public var backgroundColor: Colorable?
    
    public init() { }
    public init(_ closure: (inout ViewStyle) -> Void) {
        closure(&self)
    }
    public func apply(with view: UIView) {
        view.backgroundColor = backgroundColor?.color
    }
}

public struct View {
    public typealias Style = ViewStyle
    
    let _view: UIView = UIView()
    let style: Style
    let constraint: LayoutMaker

    public init(
        style: Style,
        constraint: LayoutMaker
        ) {
        self.style = style
        self.constraint = constraint
    }
    
    func stylize() {
        style.apply(with: _view)
    }
    
    func layout() {
        let layouts = constraint.layouts()
        _view.translatesAutoresizingMaskIntoConstraints = layouts.isEmpty
        NSLayoutConstraint.activate( layouts.layout(view: _view) )
    }
}

extension View: Viewable {
    public func activate() {
        stylize()
        layout()
    }
    
    
    public func view() -> UIView {
        return _view
    }
}
