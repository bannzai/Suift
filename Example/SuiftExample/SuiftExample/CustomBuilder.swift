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

    func layout() {
        let view = self.view()
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: view.superview!.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: view.superview!.centerYAnchor),
            view.widthAnchor.constraint(equalToConstant: 100),
            view.heightAnchor.constraint(equalToConstant: 10),
            ]
        )
    }
    
    func activateChildren(parentViewUpdateSet set: ViewUpdateSet) {
        
    }

    func stylize() {
        ViewStyle { $0.backgroundColor = UIColor.orange }
            .apply(with: view())
    }
    
    func view() -> UIView {
        return customView
    }
}
