//
//  Text.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit

public protocol Textable {
    var text: String { get }
}

public protocol TextColoable {
    var textColor: Colorable { get }
}

public struct Text: Textable, TextColoable {
    public let text: String
    public let textColor: Colorable
    public init(
        text: String,
        textColor: Colorable
        ) {
        self.text = text
        self.textColor = textColor
    }
}

