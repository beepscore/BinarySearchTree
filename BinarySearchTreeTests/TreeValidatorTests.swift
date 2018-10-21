//
//  TreeValidatorTests.swift
//  BinarySearchTreeTests
//
//  Created by Steve Baker on 10/20/18.
//  Copyright © 2018 Beepscore LLC. All rights reserved.
//

import XCTest
@testable import BinarySearchTree

class TreeValidatorTests: XCTestCase {

    func testTreeValidatorTree5() {
        let testBundle = Bundle(for: type(of: self))

        guard let node = TreeBuilder.tree(bundle: testBundle,
                                          fileName: "tree5",
                                          fileExtension: "json") else {
                                            XCTFail()
                                            return
        }

        XCTAssertTrue(TreeValidator.isValid(node: node,
                                            nodeType: .root,
                                            floor: Int.min,
                                            ceiling: Int.max))
    }

    func testTreeValidatorTree314() {
        let testBundle = Bundle(for: type(of: self))

        guard let node = TreeBuilder.tree(bundle: testBundle,
                                          fileName: "tree314",
                                          fileExtension: "json") else {
                                            XCTFail()
                                            return
        }

        XCTAssertTrue(TreeValidator.isValid(node: node,
                                            nodeType: .root,
                                            floor: Int.min,
                                            ceiling: Int.max))
    }

    func testTreeValidatorTree5381469() {
        let testBundle = Bundle(for: type(of: self))

        guard let node = TreeBuilder.tree(bundle: testBundle,
                                          fileName: "tree5381469",
                                          fileExtension: "json") else {
                                            XCTFail()
                                            return
        }

        XCTAssertTrue(TreeValidator.isValid(node: node,
                                            nodeType: .root,
                                            floor: Int.min,
                                            ceiling: Int.max))
    }

    func testTreeValidatorTree5381749() {
        let testBundle = Bundle(for: type(of: self))

        guard let node = TreeBuilder.tree(bundle: testBundle,
                                          fileName: "tree5381749",
                                          fileExtension: "json") else {
                                            XCTFail()
                                            return
        }

        XCTAssertFalse(TreeValidator.isValid(node: node,
                                             nodeType: .root,
                                             floor: Int.min,
                                             ceiling: Int.max))
    }

}
