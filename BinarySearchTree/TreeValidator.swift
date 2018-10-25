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
    ///   - node:
    ///   - floor: node value must be greater than floor.
    ///   - ceiling: node value must be less than ceiling.
    /// - Returns: true if node value is greater than floor and less than ceiling
    static func isNodeValueWithinFloorAndCeiling(node: Node, floor: Int, ceiling: Int) -> Bool {
        return node.value > floor && node.value < ceiling
    }

    /// - Parameters:
    ///   - tree: a node
    ///   - nodeType:
    ///   - floor: node value must be greater than floor.
    ///     The value of node's nearest ancestor that contains node in its right subtree.
    ///     (reset to node's parent value whenever branch right)
    ///     ignored if nodeType is root
    ///   - ceiling: node value must be less than ceiling.
    ///     The value of node's nearest ancestor that contains node in its left subtree.
    ///     (reset to node's parent value whenever branch left)
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
            // sic- node is nil, we define nil as a valid tree
            print("node is nil, returning true")
            return true
        }

        if nodeType != .root
            && !isNodeValueWithinFloorAndCeiling(node: node, floor: floor, ceiling: ceiling) {
            return false
        }

        // check node children

        // branch left, decrease ceiling
        if !isValid(node: node.left, nodeType: .left, floor: floor, ceiling: node.value) {
            return false
        }

        // branch right, increase floor
        if !isValid(node: node.right, nodeType: .right, floor: node.value, ceiling: ceiling) {
            return false
        }

        return true
    }

}
