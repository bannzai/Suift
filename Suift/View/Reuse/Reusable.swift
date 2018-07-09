//
//  Reusable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/09.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol Reusable {
    var identifier: String { get }
    
    func register()
    func dequeue(for indexPath: IndexPath)
}
