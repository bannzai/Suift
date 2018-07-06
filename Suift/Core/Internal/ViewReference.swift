//
//  ViewReference.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/06.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

internal class ViewReference {
    weak var view: UIView?
    
    init(view: UIView) {
        self.view = view
    }
}

