//
//  Structrurable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/04.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol Structrurable {
    associatedtype Style: Stylable
    associatedtype View: UIView
}


public struct ViewStructure<V: UIView>: Structrurable {
    public typealias Style = ViewStyle
    public typealias View = V
    
    let style: Style
    let constraint: LayoutMaker
    
    public init(
        style: Style,
        constraint: LayoutMaker
        ) {
        self.style = style
        self.constraint = constraint
    }
    
}
