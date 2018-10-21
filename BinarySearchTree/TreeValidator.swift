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

    static func isValid(tree: Node?, nodeType: NodeType, ancestorsMinValue: Int, ancestorsMaxValue: Int) -> Bool {

        guard let tree = tree else {
            // node is nil, we define nil as a valid tree
            return true
        }

        switch nodeType {
        case .root:
            // root has no ancestors
            break
        case .left:
            // use >= to enforce tree node values are unique
            if tree.value >= ancestorsMinValue { return false }
        case .right:
            // use <= to enforce tree node values are unique
            if tree.value <= ancestorsMaxValue { return false }
        }

        let nextAncestorsMinValue = min(tree.value, ancestorsMinValue)
        let nextAncestorsMaxValue = max(tree.value, ancestorsMaxValue)

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
