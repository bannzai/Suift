//
//  SecondViewController.swift
//  SuiftExample
//
//  Created by Yudai.Hirose on 2018/07/05.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit
import Suift

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        render()
    }

    deinit {
        print(#function)
    }

}

extension SecondViewController: Buildable {
    func build() -> Viewable {
        return View(
            style: ViewStyle { $0.backgroundColor = UIColor.white },
            constraint: LayoutMaker { view, superview, views in
                return [
                     view.topAnchor.constraint(equalTo: superview.topAnchor),
                     view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
                     view.leftAnchor.constraint(equalTo: superview.leftAnchor),
                     view.rightAnchor.constraint(equalTo: superview.rightAnchor),
                ]
            },
            children: [
                Button(
                    style: ButtonStyle {
                        $0.viewStyle = ViewStyle {
                            $0.backgroundColor = UIColor.red
                        }
                    },
                    constraint: LayoutMaker { view, superview, views in
                        return [
                            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor) ,
                            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor) ,
                            view.widthAnchor.constraint(equalToConstant: 200),
                            view.heightAnchor.constraint(equalToConstant: 50),
                            ]
                    },
                    event: ButtonEvent(
                        events: .touchUpInside,
                        closure: { [weak self] (button) in
                            self?.navigationController?.pushViewController(SecondViewController(), animated: true)
                        }
                    )
                )
            ]
        )
    }
}
