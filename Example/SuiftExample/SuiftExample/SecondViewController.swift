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
    
    let rootBag: RootBag = RootBag()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        render()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    deinit {
        print(#function)
    }

}

extension SecondViewController: Buildable {
    func build() -> Rootable {
        return CollectionView(
            view: collectionView,
            style: CollectionViewStyle {
                $0.viewStyle = ViewStyle {
                    $0.backgroundColor = UIColor.brown
                }
            },
            constraint: LayoutMaker { view, superview, views in
                return [
                    view.topAnchor.constraint(equalTo: superview.topAnchor),
                    view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
                    view.leftAnchor.constraint(equalTo: superview.leftAnchor),
                    view.rightAnchor.constraint(equalTo: superview.rightAnchor),
                    ]
            },
            source: CollectionViewSource(elements: [1,2,3]) { (integer) -> [CollectionViewSection] in
                    return [
                        CollectionViewSection(
                            elements: ["hoge", "fuga", "piyo"],
                            itemsClosure: { (string) -> [CollectionViewItem] in
                                return [
                                    CollectionViewCell(
                                        identifier: "CollectionViewCell",
                                        style: CollectionViewCellStyle {
                                            $0.viewStyle = ViewStyle {
                                                $0.backgroundColor = UIColor.gray
                                            }
                                        },
                                        children: [
                                            Label(
                                                style: LabelStyle {
                                                    $0.viewStyle = ViewStyle {
                                                        $0.backgroundColor = UIColor.blue
                                                    }
                                                },
                                                constraint: LayoutMaker { view, superview, subviews in
                                                    return [
                                                        view.topAnchor.constraint(equalTo: superview.topAnchor),
                                                        view.leftAnchor.constraint(equalTo: superview.leftAnchor),
                                                        view.rightAnchor.constraint(equalTo: superview.rightAnchor),
                                                        view.heightAnchor.constraint(equalToConstant: 44),
                                                        ]
                                                }
                                            )
                                        ],
                                        configureCell: { (cell, itemInfo) in
                                            cell.backgroundColor = .red
                                    },
                                        sizeFor: { (itemInfo) -> CGSize in
                                            return CGSize(width: 200, height: 200)
                                    })
                                ]
                        }
                        )
                    ]
            }
        )
        //        return View(
        //            style: ViewStyle {
        //                $0.backgroundColor = UIColor.white
        //            },
        //            constraint: LayoutMaker { view, superview, views in
        //                return [
        //                     view.topAnchor.constraint(equalTo: superview.topAnchor),
        //                     view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
        //                     view.leftAnchor.constraint(equalTo: superview.leftAnchor),
        //                     view.rightAnchor.constraint(equalTo: superview.rightAnchor),
        //                ]
        //            },
        //            children: [
        //                Button(
        //                    style: ButtonStyle {
        //                        $0.viewStyle = ViewStyle {
        //                            $0.backgroundColor = UIColor.red
        //                        }
        //                        $0.labelStyle = LabelStyle {
        //                            $0.textColor = UIColor.white
        //                        }
        //                    },
        //                    constraint: LayoutMaker { view, superview, views in
        //                        return [
        //                            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor) ,
        //                            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor) ,
        //                            view.widthAnchor.constraint(equalToConstant: 200),
        //                            view.heightAnchor.constraint(equalToConstant: 50),
        //                            ]
        //                    },
        //                    event: ButtonEvent(
        //                        events: .touchUpInside,
        //                        closure: { [weak self] (button) in
        //                            self?.navigationController?.pushViewController(SecondViewController(), animated: true)
        //                        }
        //                    )
        //                )
        //            ]
        //        )
    }
}
