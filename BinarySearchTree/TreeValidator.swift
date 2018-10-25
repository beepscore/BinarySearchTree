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

    static func isNodeValueWithinFloorAndCeiling(node: Node, floor: Int, ceiling: Int) -> Bool {
        return node.value > floor && node.value < ceiling
    }

    /// - Parameters:
    ///   - tree: a node
    ///   - nodeType:
    ///   - floor: node value must be greater than ceiling.
    ///     The value of the nearest ancestor that contains node in its right subtree.
    ///     (reset whenever go right)
    ///     ignored if nodeType is root
    ///   - ceiling: node value must be less than ceiling.
    ///     The value of the nearest ancestor that contains node in its left subtree.
    ///     (reset whenever go left)
    ///     ignored if nodeType is root
    /// - Returns: true if node is a valid binary search tree.
    ///   returns true if node is nil
    static func isValid(node: Node?,
                        nodeType: NodeType,
                        floor: Int,
                        ceiling: Int) -> Bool {

        print("\(String(describing: node?.description())), nodeType:\(nodeType), floor:\(floor), ceiling:\(ceiling)")

        // use many separate conditionals for easier breakpoint debugging

        // check node

        guard let node = node else {
            // node is nil, we define nil as a valid tree
            print("node is nil, returning true")
            return true
        }

        if !isNodeValueWithinFloorAndCeiling(node: node, floor: floor, ceiling: ceiling) {
            return false
        }

        // check node children

        if let nodeLeft = node.left {

            if !isNodeValueWithinFloorAndCeiling(node: nodeLeft, floor: floor, ceiling: node.value) {
                return false
            }

            // check nodeLeft subtrees

            // left, left => decrease ceiling, don't change floor
            let isLeftLeftValid = isValid(node: nodeLeft.left,
                                      nodeType: .left,
                                      floor: floor,
                                      ceiling: nodeLeft.value)
            print("\(node.description()) isLeftLeftValid: \(isLeftLeftValid)")
            if !isLeftLeftValid {
                return false
            }

            // path switched direction, so update both floor and ceiling
            let isLeftRightValid = isValid(node: nodeLeft.right,
                                          nodeType: .right,
                                          floor: nodeLeft.value,
                                          ceiling: node.value)
            print("\(node.description()) isLeftRightValid: \(isLeftRightValid)")
            if !isLeftRightValid {
                return false
            }

        }

        if let nodeRight = node.right {

            if !isNodeValueWithinFloorAndCeiling(node: nodeRight, floor: node.value, ceiling: ceiling) {
                return false
            }

            // check nodeRight subtrees

            // path switched direction, so update both floor and ceiling
            let isRightLeftValid = isValid(node: nodeRight.left,
                                          nodeType: .left,
                                          floor: node.value,
                                          ceiling: nodeRight.value)
            print("\(node.description()) isRightLeftValid: \(isRightLeftValid)")
            if !isRightLeftValid {
                return false
            }

            // right, right => increase floor, don't change ceiling
            let isRightRightValid = isValid(node: nodeRight.right,
                                           nodeType: .right,
                                           floor: nodeRight.value,
                                           ceiling: ceiling)
            print("\(node.description()) isRightRightValid: \(isRightRightValid)")
            if !isRightRightValid {
                return false
            }
        }

        return true
    }

}
