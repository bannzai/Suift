//
//  Rendable.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/19.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol Rendable {
    func renderFirst(parentView: UIView)
    func render()
}

extension Rendable where Self: ViewActivatable, Self: Viewable {
    public func renderFirst(parentView: UIView) {
        let view = self.view()
        if view.superview == nil {
            parentView.addSubview(view)
        }

        activate(for: view, viewUpdateSet: allEnabledViewUpdateSet())
    }
    
    public func render() {
        activate(for: view(), viewUpdateSet: viewUpdateSet())
    }
}

extension Rendable where Self: ViewActivatable, Self: Viewable, Self: Reloadable {
    public func renderFirst(parentView: UIView) {
        let view = self.view()
        if view.superview == nil {
            parentView.addSubview(view)
        }
        
        activate(for: view, viewUpdateSet: allEnabledViewUpdateSet())
        reload()
    }
    
    public func render() {
        activate(for: view(), viewUpdateSet: viewUpdateSet())
        reload()
    }
}

