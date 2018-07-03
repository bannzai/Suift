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
    
    let parent: UIView // TODO: Remove
    let view: UIView = UIView()
    let style: Style
    let layout: LayoutMaker

    public init(
        parent: UIView,
        style: Style,
        layout: LayoutMaker
        ) {
        self.parent = parent
        self.style = style
        self.layout = layout
    }
    
    public func build() -> UIView {
        let layouts = layout.layouts()
        view.translatesAutoresizingMaskIntoConstraints = layouts.isEmpty
        
        if view.superview == nil {
            parent.addSubview(view)
        }
        
        NSLayoutConstraint.activate( layouts.layout(view: view) )

        style.apply(with: view)
        
        return view
    }
}
