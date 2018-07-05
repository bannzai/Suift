//
//  View.swift
//  SuiftExample
//
//  Created by Yudai.Hirose on 2018/07/05.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit
import Suift

class BuildableView: UIView, Viewable {
    let style: ViewStyle = ViewStyle { $0.backgroundColor = UIColor.brown }
    let constraint: LayoutMaker = LayoutMaker { view, superview, subviews in
        return [
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leftAnchor.constraint(equalTo: superview.leftAnchor),
            view.rightAnchor.constraint(equalTo: superview.rightAnchor),
            view.heightAnchor.constraint(equalToConstant: 30),
            ]
    }
    let children: [ViewableProxy] = []
    
    public required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        render()
    }
    
    func stylize() {
        let view = self.view()
        style.apply(with: view)
    }

    func view() -> UIView {
        return self
    }
}

extension BuildableView: Buildable {
    func build() -> Viewable {
        return View<CustomView>(
            style: ViewStyle {
                $0.backgroundColor = UIColor.yellow
            },
            constraint: LayoutMaker { view, superview, subviews in
                return [
                    view.topAnchor.constraint(equalTo: superview.topAnchor),
                    view.leftAnchor.constraint(equalTo: superview.leftAnchor),
                    view.rightAnchor.constraint(equalTo: superview.rightAnchor),
                    view.heightAnchor.constraint(equalToConstant: 10),
                    ]
            }
        )
    }
}
