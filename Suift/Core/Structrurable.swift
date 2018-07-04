//
//  Structrurable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/04.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol Structrurable {
    associatedtype Style: Style
    associatedtype View: UIView
}


public struct ViewStructure<V: UIView>: Structrurable {
    public typealias Style = ViewStyle
    public typealias View = V
    
    let style: Style
    let constraint: LayoutMaker
    let children: [Viewable]

    public init(
        style: Style,
        constraint: LayoutMaker,
        children: [Viewable]
        ) {
        self.style = style
        self.constraint = constraint
        self.children = children
    }
}
