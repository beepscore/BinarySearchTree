//
//  Node.swift
//  BinarySearchTree
//
//  Created by Steve Baker on 10/20/18.
//  Copyright © 2018 Beepscore LLC. All rights reserved.
//

import Foundation

class Node: Equatable, Decodable {
    var value: Int
    var left: Node?
    var right: Node?

    init(value: Int, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }

    func hasNoChildren() -> Bool {
        return left == nil && right == nil
    }

    // TODO: consider may prefer to add a method "isEqual(node: Node)"
    // rather than conform to Equatable and override "=="
    static func == (lhs: Node, rhs: Node) -> Bool {

        let isEqual = ((lhs.value == rhs.value)
            && (lhs.left == rhs.left)
            && (lhs.right == rhs.right))

        return isEqual
    }

    func description() -> String {
        return "value:\(self.value), left:\(String(describing: left?.value)), right:\(String(describing: right?.value))"
    }

}
