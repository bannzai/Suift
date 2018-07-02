//
//  ViewController.swift
//  SuiftExample
//
//  Created by Yudai.Hirose on 2018/07/02.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import UIKit
import Suift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(
            View(
                style: ViewStyle {
                    $0.backgroundColor = Color.RGB(red: 255 / 255, green: 100 / 255, blue: 80 / 255)
                },
                layout: LayoutMaker(
                    parent: view,
                    layouts: [
                        Layout { $0.topAnchor.constraint(equalTo: self.view.topAnchor) },
                        Layout { $0.leftAnchor.constraint(equalTo: self.view.leftAnchor) },
                        Layout { $0.bottomAnchor.constraint(equalTo: self.view.bottomAnchor) },
                        Layout { $0.rightAnchor.constraint(equalTo: self.view.rightAnchor) },
                    ]
                )
                )
                .build()
        )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

