//
//  CollectionViewComponent.swift
//  Suift
//
//  Created by Yudai.Hirose on 2018/07/07.
//  Copyright © 2018年 廣瀬雄大. All rights reserved.
//

import Foundation


public class CollectionViewComponent: NSObject {
    public weak var collectionView: UICollectionView?
    public var sections: [CollectionViewSectionType] = []
    
    func itemFor(indexPath: IndexPath) -> CollectionViewItemType {
        return sections[indexPath.section].items[indexPath.item]
    }
}

extension CollectionViewComponent: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = itemFor(indexPath: indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.reusableIdentifier, for: indexPath)
        (item as? CollectionViewItemDelegatable)?.configureCell(collectionView: collectionView, cell: cell, indexPath: indexPath)
        return cell
    }
    
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let type = CollectionViewSectionHeaderFooterKind(kind: kind) else {
            fatalError("Unknown kind: \(kind)")
        }
        switch type {
        case .header:
            if let header = sections[indexPath.section].header,
                let view = headerFooterViewFor(headerFooter: header, collectionView: collectionView, indexPath: indexPath) {
                return view
            }
        case .footer:
            if let footer = sections[indexPath.section].footer,
                let view = headerFooterViewFor(headerFooter: footer, collectionView: collectionView, indexPath: indexPath) {
                return view
            }
        }
        fatalError()
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        fatalError()
    }
    
    
    public func indexTitles(for collectionView: UICollectionView) -> [String]? {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
        fatalError()
    }
}

extension CollectionViewComponent: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        fatalError()
    }

    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        guard
            let headerFooter = headerOrFooterOrNil(for: elementKind, section: indexPath.section),
            let delegate = delegate(headerFooter: headerFooter)
            else {
                return
        }
        delegate.willDisplay(collectionView, view: view, indexPath: indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        guard
            let headerFooter = headerOrFooterOrNil(for: elementKind, section: indexPath.section),
            let delegate = delegate(headerFooter: headerFooter)
            else {
                return
        }
        delegate.didEndDisplay(collectionView, view: view, indexPath: indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        fatalError()
    }
    
    public func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath? {
        fatalError()
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
        fatalError()
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        fatalError()
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, shouldSpringLoadItemAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        fatalError()
    }
}

extension CollectionViewComponent: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if let header = sections[section].header,
            let size = sectionHeaderFooterSizeFor(headerFooter: header, collectionView: collectionView, section: section) {
            return size
        }
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            return layout.headerReferenceSize
        }
        return .zero
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if let footer = sections[section].header,
            let size = sectionHeaderFooterSizeFor(headerFooter: footer, collectionView: collectionView, section: section) {
            return size
        }
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            return layout.headerReferenceSize
        }
        return .zero
    }
}

fileprivate extension CollectionViewComponent {
    func delegate(headerFooter: CollectionViewSectionHeaderFooterViewable) -> CollectionViewSectionHeaderFooterDelegateType? {
        return headerFooter as? CollectionViewSectionHeaderFooterDelegateType
    }
    
    func headerOrFooter(for kind: CollectionViewSectionHeaderFooterKind, section: Int) -> CollectionViewSectionHeaderFooterViewable? {
        switch kind {
        case .header:
            return sections[section].header
        case .footer:
            return sections[section].footer
        }
    }
    
    func headerOrFooterOrNil(for kind: String, section: Int) -> CollectionViewSectionHeaderFooterViewable? {
        guard let type = CollectionViewSectionHeaderFooterKind(kind: kind) else {
            return nil
        }
        return headerOrFooter(for: type, section: section)
    }
    
    func headerFooterViewFor(headerFooter: CollectionViewSectionHeaderFooterViewable, collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView? {
        // Dequeue
        if let identifier = headerFooter.reuseIdentifier {
            let view = dequeueReusableSupplementaryView(collectionView: collectionView, kind: headerFooter.kind.kind, identifier: identifier, indexPath: indexPath)
            if let delegate = delegate(headerFooter: headerFooter) {
                delegate.configureView(collectionView, view: view, section: indexPath.section)
            }
            return view
        }
        
        return nil
    }
    
    func sectionHeaderFooterSizeFor(headerFooter: CollectionViewSectionHeaderFooterViewable, collectionView: UICollectionView, section: Int) -> CGSize? {
        if let delegate = delegate(headerFooter: headerFooter),
            let size = delegate.sizeFor(collectionView, section: section) {
            return size
        }
        
        return headerFooter.size
    }

    func dequeueReusableSupplementaryView(collectionView: UICollectionView, kind: String, identifier: String, indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath)
    }
}
