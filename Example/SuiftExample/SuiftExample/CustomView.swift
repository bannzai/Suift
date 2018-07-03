//
//  CustomView.swift
//  SuiftExample
//
//  Created by Yudai.Hirose on 2018/07/04.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit

class CustomView: UIView {
    public required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 4
        layer.borderColor = Color.RGB(red: 0, green: 0, blue: 0).color.cgColor
        layer.borderWidth = 1
    }
}
