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
    ///   - floor: node value must be greater than min (reset whenever go right)
    ///     ignored if nodeType is root
    ///   - ceiling: node value must be less than max (reset whenever go left)
    ///     ignored if nodeType is root
    /// - Returns: true if node is a valid binary search tree.
    ///   returns true if node is nil
    static func isValid(node: Node?,
                        nodeType: NodeType,
                        floor: Int,
                        ceiling: Int) -> Bool {

        guard let node = node else {
            // node is nil, we define nil as a valid tree
            print("node is nil, returning true")
            return true
        }

        print("\(node.description()), nodeType:\(nodeType), floor:\(floor), ceiling:\(ceiling)")

        if let nodeLeft = node.left {
            if nodeLeft.value >= node.value {
                return false
            }
            if !isNodeValueWithinFloorAndCeiling(node: nodeLeft, floor: floor, ceiling: ceiling) {
                return false
            }
        }

        if let nodeRight = node.right {
            if nodeRight.value <= node.value {
                return false
            }
            if !isNodeValueWithinFloorAndCeiling(node: nodeRight, floor: floor, ceiling: ceiling) {
                return false
            }
        }

        // prepare for recursive calls by calculating nextFloor and nextCeiling
        // start with previous values
        var nextFloor = floor
        var nextCeiling = ceiling

        if nodeType == .root {
            // root ignores arguments floor and ceiling
            nextFloor = Int.min
            nextCeiling = Int.max
        } else if nodeType == .left {
            nextCeiling = min(ceiling, node.value)
        } else if nodeType == .right {
            nextFloor = max(floor, node.value)
        }

        let isLeftValid = isValid(node: node.left,
                                  nodeType: .left,
                                  floor: nextFloor,
                                  ceiling: node.value)
        print("\(node.description()) isLeftValid: \(isLeftValid)")
        if !isLeftValid {
            return false
        }

        let isRightValid = isValid(node: node.right,
                                   nodeType: .right,
                                   floor: node.value,
                                   ceiling: nextCeiling)
        print("\(node.description()) isRightValid: \(isRightValid)")
        if !isRightValid {
            return false
        }

        return true
    }


}
