//
//  TreeValidator.swift
//  BinarySearchTree
//
//  Created by Steve Baker on 10/20/18.
//  Copyright © 2018 Beepscore LLC. All rights reserved.
//

import Foundation

class TreeValidator {

    /// - Parameters:
    ///   - node:
    ///   - floor: if not nil, node value must be greater than floor. ignored if nil.
    ///   - ceiling: if not nil, node value must be less than ceiling. ignored if nil.
    /// - Returns: true if node value is greater than floor and less than ceiling
    static func isNodeValueWithinFloorAndCeiling(node: Node, floor: Int?, ceiling: Int?) -> Bool {
        if let floorUnwrapped = floor {
            if node.value <= floorUnwrapped { return false }
        }
        if let ceilingUnwrapped = ceiling {
            if node.value >= ceilingUnwrapped { return false }
        }
        return true
    }

    /// Checks if a node represents a valid binary search tree.
    /// When calling with a root node,
    /// caller should explicitly specify floor nil and ceiling nil or let them default to nil
    /// - Parameters:
    ///   - tree: a node
    ///   - floor: node value must be greater than floor.
    ///     The value of node's nearest ancestor that contains node in its right subtree.
    ///     (reset to node's parent value whenever branch right)
    ///     ignored if nil
    ///   - ceiling: node value must be less than ceiling.
    ///     The value of node's nearest ancestor that contains node in its left subtree.
    ///     (reset to node's parent value whenever branch left)
    ///     ignored if nil
    /// - Returns: true if node is a valid binary search tree.
    ///   returns true if node is nil
    static func isValid(node: Node?, floor: Int? = nil, ceiling: Int? = nil) -> Bool {

        print("\(String(describing: node?.description())), floor:\(String(describing: floor)), ceiling:\(String(describing: ceiling))")

        // use many separate conditionals for easier breakpoint debugging

        // check node

        guard let node = node else {
            // sic- node is nil, we define nil as a valid tree
            print("node is nil, returning true")
            return true
        }

        if !isNodeValueWithinFloorAndCeiling(node: node, floor: floor, ceiling: ceiling) {
            return false
        }

        // check node children

        // branch left, decrease ceiling
        if !isValid(node: node.left, floor: floor, ceiling: node.value) {
            return false
        }

        // branch right, increase floor
        if !isValid(node: node.right, floor: node.value, ceiling: ceiling) {
            return false
        }

        return true
    }

}
