//
//  Builder.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit

public protocol Buildable {
    func build() -> Viewable
}

extension Buildable where Self: UIViewController {
    public func render() {
        let builder = build()
        let subview = builder.view()
        
        if subview.superview == nil {
            view.addSubview(subview)
        }
        
        builder.activate()
    }
}

