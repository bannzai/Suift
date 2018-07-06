//
//  Equtable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/06.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol CustomEqutable {
    func isEqual(compare: Any) -> Bool
}
