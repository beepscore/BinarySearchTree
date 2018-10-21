//
//  TreeValidator.swift
//  BinarySearchTree
//
//  Created by Steve Baker on 10/20/18.
//  Copyright © 2018 Beepscore LLC. All rights reserved.
//

import Foundation

class TreeValidator {

    enum NodeType {
        case left
        case right
        case root
    }

    /// - Parameters:
    ///   - tree: a node
    ///   - nodeType:
    ///   - ancestorsMinValue: ignored if NodeType is .root
    ///   - ancestorsMaxValue: ignored if NodeType is .root
    /// - Returns: true if node is a valid binary search tree.
    ///   returns true if node is nil
    static func isValid(tree: Node?, nodeType: NodeType, ancestorsMinValue: Int, ancestorsMaxValue: Int) -> Bool {

        guard let tree = tree else {
            // node is nil, we define nil as a valid tree
            return true
        }

        // assign placeholder value
        var nextAncestorsMinValue = 0
        var nextAncestorsMaxValue = 0

        if nodeType == .root {
            nextAncestorsMinValue = tree.value
            nextAncestorsMaxValue = tree.value
        } else {

            nextAncestorsMinValue = min(tree.value, ancestorsMinValue)
            nextAncestorsMaxValue = max(tree.value, ancestorsMaxValue)

            if nodeType == .left {
                // use >= to enforce tree node values are unique
                if tree.value >= ancestorsMinValue { return false }
            }

            if nodeType == .right {
                // use <= to enforce tree node values are unique
                if tree.value <= ancestorsMaxValue { return false }
            }
        }

        let areBothSubtreesValid = isValid(tree: tree.left,
                                           nodeType: .left,
                                           ancestorsMinValue: nextAncestorsMinValue,
                                           ancestorsMaxValue: nextAncestorsMaxValue)
            && isValid(tree: tree.right,
                       nodeType: .right,
                       ancestorsMinValue: nextAncestorsMinValue,
                       ancestorsMaxValue: nextAncestorsMaxValue)

        return areBothSubtreesValid
    }

}
