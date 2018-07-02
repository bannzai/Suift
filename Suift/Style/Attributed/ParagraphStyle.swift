//
//  Paragraph.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/03.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public enum ParagraphStyle {
    case lineSpacing(CGFloat)
    case paragraphSpacing(CGFloat)
    case alignment(NSTextAlignment)
    case firstLineHeadIndent(CGFloat)
    case headIndent(CGFloat)
    case tailIndent(CGFloat)
    case lineBreakMode(NSLineBreakMode)
    case minimumLineHeight(CGFloat)
    case maximumLineHeight(CGFloat)
    case baseWritingDirection(NSWritingDirection)
    case lineHeightMultiple(CGFloat)
    case paragraphSpacingBefore(CGFloat)
    case hyphenationFactor(Float)
    
    indirect case complex([ParagraphStyle])
    
    public func style() -> NSParagraphStyle {
        return ParagraphStyleBuilder().append(for: self).build()
    }
}
