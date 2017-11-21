//
//  UIView+QLContentWrap.swift
//  QuickLayout
//
//  Created by Daniel Huri on 11/21/17.
//

import Foundation

// MARK: Content Compression Resistance & Content Hugging Priority
public extension UIView {

    // MARK: Content wrap by axis
    public func forceContentWrap(_ axes: LayoutAxis...) {
        if axes.contains(.vertically) {
            verticalHuggingPriority = .required
            verticalCompressionResistancePriority = .required
        }
        if axes.contains(.horizontally) {
            horizontalHuggingPriority = .required
            horizontalCompressionResistancePriority = .required
        }
    }
    
    // MARK: Full content wrap
    public func forceContentWrap() {
        contentHuggingPriority = .required
        contentCompressionResistancePriority = .required
    }
    
    // MARK: Content Hugging Priority
    public var verticalHuggingPriority: UILayoutPriority {
        set {
            setContentHuggingPriority(newValue, for: .vertical)
        }
        get {
            return contentHuggingPriority(for: .vertical)
        }
    }
    
    public var horizontalHuggingPriority: UILayoutPriority {
        set {
            setContentHuggingPriority(newValue, for: .horizontal)
        }
        get {
            return contentHuggingPriority(for: .horizontal)
        }
    }
    
    public var contentHuggingPriority: QLPriorityPair {
        set {
            horizontalHuggingPriority = newValue.horizontal
            verticalHuggingPriority = newValue.vertical
        }
        get {
            return QLPriorityPair(horizontal: horizontalHuggingPriority, vertical: verticalHuggingPriority)
        }
    }
    
    // MARK: Content Compression Resistance
    public var verticalCompressionResistancePriority: UILayoutPriority {
        set {
            setContentCompressionResistancePriority(newValue, for: .vertical)
        }
        get {
            return contentCompressionResistancePriority(for: .vertical)
        }
    }
    
    public var horizontalCompressionResistancePriority: UILayoutPriority {
        set {
            setContentCompressionResistancePriority(newValue, for: .horizontal)
        }
        get {
            return contentCompressionResistancePriority(for: .horizontal)
        }
    }
    
    public var contentCompressionResistancePriority: QLPriorityPair {
        set {
            horizontalCompressionResistancePriority = newValue.horizontal
            verticalCompressionResistancePriority = newValue.vertical
        }
        get {
            return QLPriorityPair(horizontal: horizontalCompressionResistancePriority, vertical: verticalCompressionResistancePriority)
        }
    }
}