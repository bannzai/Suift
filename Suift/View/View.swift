//
//  View.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/02.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public struct ViewStyle {
    public var backgroundColor: UIColor?
    
    public init() { }
    public init(_ closure: (inout ViewStyle) -> Void) {
        closure(&self)
    }
    public func apply(with view: UIView) {
        view.backgroundColor = backgroundColor
    }
}

public struct Layout {
//    public var left: (UIView) -> NSLayoutConstraint
//    public var top: (UIView) -> NSLayoutConstraint
//    public var right: (UIView) -> NSLayoutConstraint
//    public var bottom: (UIView) -> NSLayoutConstraint
//    public var centerX: (UIView) -> NSLayoutConstraint
//    public var centerY: (UIView) -> NSLayoutConstraint
    public typealias Method = (UIView) -> NSLayoutConstraint
    
    public var constraint: Method
    public init(constraint: @escaping Method) {
        self.constraint = constraint
    }
}

public struct LayoutMaker {
    let parent: UIView
    let layouts: [Layout]
    
    public init(
        parent: UIView,
        layouts: [Layout]
        ) {
        self.parent = parent
        self.layouts = layouts
    }
}

public struct View {
    public typealias Style = ViewStyle
    
    let view: UIView = UIView()
    let style: Style
    let layout: LayoutMaker

    public init(
        style: Style,
        layout: LayoutMaker
        ) {
        self.style = style
        self.layout = layout
    }
    
    public func build() -> UIView {
        view.translatesAutoresizingMaskIntoConstraints = layout.layouts.isEmpty
        
        if view.superview == nil {
            layout.parent.addSubview(view)
        }
        
        NSLayoutConstraint.activate( layout.layouts.map { $0.constraint(view) })

        style.apply(with: view)
        
        return view
    }
}
