//
//  View.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/02.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public struct ViewStyle: Stylable {
    public var backgroundColor: Colorable?
    
    public init() { }
    
    public func apply(with view: UIView) {
        view.backgroundColor = backgroundColor?.color
    }
}

public struct View<V: UIView>: Viewable {
    let _view = V()
    let structure: ViewStructure<V>

    public init(
        style: ViewStyle,
        constraint: LayoutMaker
        ) {
        self.init(
            structure: ViewStructure<V>(
                style: style,
                constraint: constraint
            )
        )
    }
    
    init(
        structure: ViewStructure<V>
        ) {
        self.structure = structure
    }
    
    func stylize() {
        structure.style.apply(with: _view)
    }
    
    func layout() {
        let layouts = structure.constraint.layouts()
        _view.translatesAutoresizingMaskIntoConstraints = layouts.isEmpty
        NSLayoutConstraint.activate( layouts.layout(view: _view) )
    }
    
    public func activate() {
        stylize()
        layout()
    }
    
    public func view() -> UIView {
        return _view
    }
}
