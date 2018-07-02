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
    
    public var constraint: (UIView) -> NSLayoutConstraint
}

public struct View {
    public typealias Style = ViewStyle
    public lazy var view: UIView = {
       return UIView()
    }()
    
    public init(
        style: Style,
        layouts: [Layout]
        ) {
        NSLayoutConstraint.activate(
            layouts.map { $0.constraint(view) }
        )
        style.apply(with: view)
    }
    
    func build() -> UIView {
        return view
    }
}
