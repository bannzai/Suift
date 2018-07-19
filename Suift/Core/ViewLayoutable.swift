//
//  ViewLayoutable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/18.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol ViewLayoutable {
    var constraint: LayoutMaker { get }
    func layout(for view: UIView)
}

extension ViewLayoutable {
    public func layout(for view: UIView) {
        let set: ViewSetForLayout = (view, view.superview!, view.superview!.subviews)
        let layouts = constraint.layout(set: set)
        view.translatesAutoresizingMaskIntoConstraints = layouts.isEmpty
        NSLayoutConstraint.activate( layouts )
    }
}
