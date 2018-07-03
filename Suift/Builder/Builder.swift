//
//  Builder.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol Buidlable {
    func build() -> Rootable
}

public protocol Rootable {
    
}

public protocol Viewable: Rootable {
    associatedtype View: UIView
    func view() -> View
}


