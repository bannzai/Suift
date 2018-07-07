//
//  CollectionViewHeaderFooter.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/07.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public protocol CollectionViewSectionHeaderFooterType {
    var reuseIdentifier: String? { get }
    var size: CGSize? { get set }
}

protocol CollectionViewSectionHeaderFooterDelegateType {
    func configureView(_ collectionView: UICollectionView, view: UIView, section: Int)
    func sizeFor(_ collectionView: UICollectionView, section: Int) -> CGSize?
    func referenceSizeForHeader(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize?
    func referenceSizeForFooter(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize?
}

open class CollectionViewSectionHeaderFooter<View: UICollectionReusableView>: CollectionViewSectionHeaderFooterType {
    public typealias CollectionViewSectionHeaderFooterInformation = (headerFooter: CollectionViewSectionHeaderFooter<View>, collectionView: UICollectionView, section: Int)
    public typealias CollectionViewSectionHeaderFooterLayoutInformation = (headerFooter: CollectionViewSectionHeaderFooter<View>, collectionView: UICollectionView, layout: UICollectionViewLayout, section: Int)
    
    public init() { }
    
    public init(closure: ((CollectionViewSectionHeaderFooter<View>) -> Void)) {
        closure(self)
    }
    
    fileprivate var _reuseIdentifier: String?
    open var reuseIdentifier: String? {
        set {
            _reuseIdentifier = newValue
        }
        get {
            if let identifier = _reuseIdentifier {
                return identifier
            }
            return nil
        }
    }
    
    open var size: CGSize?
//    open var kind: String?

    open var configureView: ((View, CollectionViewSectionHeaderFooterInformation) -> Void)?
    open var sizeFor: ((CollectionViewSectionHeaderFooterInformation) -> CGSize?)?
    open var referenceSizeForHeader: ((CollectionViewSectionHeaderFooterLayoutInformation) -> CGSize?)?
    open var referenceSizeForFooter: ((CollectionViewSectionHeaderFooterLayoutInformation) -> CGSize?)?
}

extension CollectionViewSectionHeaderFooter: CollectionViewSectionHeaderFooterDelegateType {
    func configureView(_ collectionView: UICollectionView, view: UIView, section: Int) {
        guard let genericView = view as? View else {
            fatalError()
        }
        configureView?(genericView, (self, collectionView, section))
    }
    
    func sizeFor(_ collectionView: UICollectionView, section: Int) -> CGSize? {
        return sizeFor?((self, collectionView, section)) ?? size
    }
    
    func referenceSizeForHeader(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize? {
        return referenceSizeForHeader?((self, collectionView, collectionViewLayout, section)) ?? size
    }
    func referenceSizeForFooter(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize? {
        return referenceSizeForHeader?((self, collectionView, collectionViewLayout, section)) ?? size
    }
//    func reusableViewFor(collectionView: UICollectionView, supplementaryOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//    }
}
