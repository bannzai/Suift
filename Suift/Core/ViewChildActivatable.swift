//
//  ViewChildActivatable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/18.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol ViewChildActivatable {
    func activateChildren(for view: UIView, parentViewUpdateSet set: ViewUpdateSet)
}
