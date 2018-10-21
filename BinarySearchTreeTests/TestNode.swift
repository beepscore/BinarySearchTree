//
//  TestNode.swift
//  BinarySearchTreeTests
//
//  Created by Steve Baker on 10/20/18.
//  Copyright © 2018 Beepscore LLC. All rights reserved.
//

import XCTest
@testable import BinarySearchTree

class TestNode: XCTestCase {

    func testInitNoChildren() {
        let node = Node(value: 5, left: nil, right: nil)
        XCTAssertNotNil(node)
        XCTAssertEqual(node.value, 5)
        XCTAssertNil(node.left)
        XCTAssertNil(node.right)
    }

    func testInitNodeWithLeft() {
        let left = Node(value: 3, left: nil, right: nil)
        let node = Node(value: 5, left: left, right: nil)
        XCTAssertNotNil(node)
        XCTAssertEqual(node.value, 5)
        XCTAssertEqual(node.left, left)
        XCTAssertNil(node.right)
    }

}
