//
//  CustomBuilder.swift
//  SuiftExample
//
//  Created by Yudai.Hirose on 2018/07/04.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit
import Suift

struct CustomViewBuilder: Viewable {
    let customView = CustomView()
    let constraint = LayoutMaker { view, superview, subviews in
        return [
            { view.centerXAnchor.constraint(equalTo: superview.centerXAnchor) },
            { view.centerYAnchor.constraint(equalTo: superview.centerYAnchor) },
            { view.widthAnchor.constraint(equalToConstant: 100) },
            { view.heightAnchor.constraint(equalToConstant: 10) },
            ]
    }
    let children: [ViewableProxy] = []
    
    func stylize() {
        ViewStyle { $0.backgroundColor = UIColor.orange }
            .apply(with: view())
    }
    
    func view() -> UIView {
        return customView
    }
}
