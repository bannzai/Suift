//
//  CollectionViewHeaderFooter.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/09.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation

public enum CollectionViewSectionHeaderFooterKind {
    case header
    case footer
    
    init?(kind: String) {
        switch kind {
        case UICollectionElementKindSectionHeader:
            self = .header
        case UICollectionElementKindSectionFooter:
            self = .footer
        case _:
            return nil
        }
    }
    
    var kind: String {
        switch self {
        case .header:
            return UICollectionElementKindSectionHeader
        case .footer:
            return UICollectionElementKindSectionFooter
        }
    }
}

public struct CollectionReusableViewStyle: Style {
    public var viewStyle: ViewStyle?
    
    public init() { }
    public func apply(with reusableView: UICollectionReusableView) {
        reusableView.backgroundColor = viewStyle?.backgroundColor?.color
    }
}

extension CollectionReusableViewStyle: SuiftEquatable {
    public static func == (lhs: CollectionReusableViewStyle, rhs: CollectionReusableViewStyle) -> Bool {
        return lhs.viewStyle == rhs.viewStyle
    }
}

public protocol CollectionViewSectionHeaderFooterViewable: CollectionViewReusable {
    var size: CGSize? { get set }
    var kind: CollectionViewSectionHeaderFooterKind { get }
}

protocol CollectionViewSectionHeaderFooterDelegatable {
    func configureView(_ collectionView: UICollectionView, view: UICollectionReusableView, section: Int)
    func sizeFor(_ collectionView: UICollectionView, section: Int) -> CGSize?
    func willDisplay(_ collectionView: UICollectionView, view: UICollectionReusableView, indexPath: IndexPath)
    func didEndDisplay(_ collectionView: UICollectionView, view: UICollectionReusableView, indexPath: IndexPath)
}

open class CollectionViewSectionHeaderFooter<View: UICollectionReusableView>: CollectionViewSectionHeaderFooterViewable {

    public typealias CollectionViewSectionHeaderFooterInformation = (headerFooter: CollectionViewSectionHeaderFooter<View>, collectionView: UICollectionView, section: Int)
    public typealias CollectionViewSectionHeaderFooterLayoutInformation = (headerFooter: CollectionViewSectionHeaderFooter<View>, collectionView: UICollectionView, layout: UICollectionViewLayout, section: Int)
    public typealias CollectionViewSectionHeaderFooterSupplymentaryView = (headerFooter: CollectionViewSectionHeaderFooter<View>, collectionView: UICollectionView,  indexPath: IndexPath)
    
    public let identifier: String

    open var size: CGSize?
    open let kind: CollectionViewSectionHeaderFooterKind
    
    public let style: CollectionReusableViewStyle // FIXME: move to Viewable
    public let children: [ViewChildable]
    
    open let configureView: ((View, CollectionViewSectionHeaderFooterInformation) -> Void)?
    open let sizeFor: ((CollectionViewSectionHeaderFooterInformation) -> CGSize?)?
    open let willDisplay: ((View, CollectionViewSectionHeaderFooterSupplymentaryView) -> Void)?
    open let didEndDisplay: ((View, CollectionViewSectionHeaderFooterSupplymentaryView) -> Void)?
    
    public init(
        identifier: String? = nil,
        kind: CollectionViewSectionHeaderFooterKind,
        
        style: CollectionReusableViewStyle,
        children: [ViewChildable] = [],

        configureView: ((View, CollectionViewSectionHeaderFooterInformation) -> Void)? = nil,
        sizeFor: ((CollectionViewSectionHeaderFooterInformation) -> CGSize?)? = nil,
        willDisplay: ((View, CollectionViewSectionHeaderFooterSupplymentaryView) -> Void)? = nil,
        didEndDisplay: ((View, CollectionViewSectionHeaderFooterSupplymentaryView) -> Void)? = nil
        ) {
        self.identifier = identifier ?? View.className
        self.kind = kind
        
        self.style = style
        self.children = children

        self.configureView = configureView
        self.sizeFor = sizeFor
        self.willDisplay = willDisplay
        self.didEndDisplay = didEndDisplay
    }
}

extension CollectionViewSectionHeaderFooter: CollectionViewReusable {
    public func register(to collectionView: UICollectionView) {
        collectionView.register(View.self, forSupplementaryViewOfKind: kind.kind, withReuseIdentifier: identifier)
    }
}

extension CollectionViewSectionHeaderFooter: ViewStylizable {
    public func stylize(for view: UIView) {
        style.apply(with: view as! View)
    }
}

extension CollectionViewSectionHeaderFooter: ViewChildActivatable { }
extension CollectionViewSectionHeaderFooter: ViewUpdateDecidable { }

extension CollectionViewSectionHeaderFooter: CollectionViewSectionHeaderFooterDelegatable {
    func configureView(_ collectionView: UICollectionView, view: UICollectionReusableView, section: Int) {
        guard let view = view as? View else {
            fatalError()
        }
        stylize(for: view)
        activateChildren(for: view, parentViewUpdateSet: viewUpdateSet())
        configureView?(view, (self, collectionView, section))
    }
    
    func sizeFor(_ collectionView: UICollectionView, section: Int) -> CGSize? {
        return sizeFor?((self, collectionView, section)) ?? size
    }
    
    func willDisplay(_ collectionView: UICollectionView, view: UICollectionReusableView, indexPath: IndexPath) {
        guard let view = view as? View else {
            fatalError()
        }
        willDisplay?(view, (self, collectionView, indexPath))
    }
    
    func didEndDisplay(_ collectionView: UICollectionView, view: UICollectionReusableView, indexPath: IndexPath) {
        guard let view = view as? View else {
            fatalError()
        }
        didEndDisplay?(view, (self, collectionView, indexPath))
    }
}
