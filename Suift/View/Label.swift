//
//  Label.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/05.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit

public struct LabelStyle: Style {
    public var viewStyle: ViewStyle?
    
    public var textColor: Colorable?
    
    public init() { }
    public func apply(with label: UILabel) {
        label.backgroundColor = viewStyle?.backgroundColor?.color
        label.textColor = textColor?.color
    }
}

extension LabelStyle: SuiftEquatable {
    public static func == (lhs: LabelStyle, rhs: LabelStyle) -> Bool {
        return lhs.viewStyle == rhs.viewStyle &&
            OptoinalEqual.isEqual(lhs.textColor, rhs.textColor)
    }
}

public struct Label<V: UILabel>: Rootable {
    let _label: V
    
    public let style: LabelStyle
    public let constraint: LayoutMaker
    public let children: [ViewableProxy]

    public init(
        label: V? = nil,
        style: LabelStyle,
        constraint: LayoutMaker,
        children: [ViewableProxy] = []
        ) {
        if let label = label {
            self._label = label
        } else {
            self._label = V()
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
        return _label
    }
}
