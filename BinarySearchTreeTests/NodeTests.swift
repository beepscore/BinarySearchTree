//
//  NodeTests.swift
//  BinarySearchTreeTests
//
//  Created by Steve Baker on 10/20/18.
//  Copyright © 2018 Beepscore LLC. All rights reserved.
//

import XCTest
@testable import BinarySearchTree

class NodeTests: XCTestCase {

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

    func testEquatable() {
        let child0 = Node(value: 3, left: nil, right: nil)
        let child1 = Node(value: 3, left: nil, right: nil)

        var parent0 = Node(value: 5, left: child0, right: nil)
        var parent1 = Node(value: 5, left: child1, right: nil)
        XCTAssertEqual(parent1, parent0)

        parent0 = Node(value: 5, left: nil, right: child0)
        parent1 = Node(value: 5, left: nil, right: nil)
        XCTAssertNotEqual(parent1, parent0)
    }

    func testDecodableTree5() {
        let testBundle = Bundle(for: type(of: self))
        guard let jsonString = FileUtils.string(bundle: testBundle, fileName: "tree5", fileExtension: "json") else {
            XCTFail()
            return
        }

        guard let jsonData = jsonString.data(using: .utf8) else {
            XCTFail()
            return
        }

        let decoder = JSONDecoder()
        guard let node = try? decoder.decode(Node.self, from: jsonData) else {
            XCTFail()
            return
        }

        XCTAssertNotNil(node)
        XCTAssertEqual(node.value, 5)
        XCTAssertNil(node.left)
        XCTAssertNil(node.right)
    }

    func testDecodableTree314() {
        let testBundle = Bundle(for: type(of: self))
        guard let jsonString = FileUtils.string(bundle: testBundle, fileName: "tree314", fileExtension: "json") else {
            XCTFail()
            return
        }

        guard let jsonData = jsonString.data(using: .utf8) else {
            XCTFail()
            return
        }

        let decoder = JSONDecoder()
        guard let node = try? decoder.decode(Node.self, from: jsonData) else {
            XCTFail()
            return
        }

        XCTAssertNotNil(node)
        XCTAssertEqual(node.value, 3)
        XCTAssertEqual(node.left?.value, 1)
        XCTAssertEqual(node.right?.value, 4)
        
        XCTAssertNil(node.left?.left)
        XCTAssertNil(node.left?.right)
        XCTAssertNil(node.right?.left)
        XCTAssertNil(node.right?.right)
    }

}
