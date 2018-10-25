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

        // root node, explicitly specify floor and ceiling nil
        XCTAssertTrue(TreeValidator.isValid(node: node, floor: nil, ceiling: nil))
    }

    func testTreeValidatorTree314() {
        let testBundle = Bundle(for: type(of: self))

        guard let node = TreeBuilder.tree(bundle: testBundle,
                                          fileName: "tree314",
                                          fileExtension: "json") else {
                                            XCTFail()
                                            return
        }

        // root node, use default nil for floor and ceiling
        XCTAssertTrue(TreeValidator.isValid(node: node))
    }

    func testTreeValidatorTree5381469() {
        let testBundle = Bundle(for: type(of: self))

        guard let node = TreeBuilder.tree(bundle: testBundle,
                                          fileName: "tree5381469",
                                          fileExtension: "json") else {
                                            XCTFail()
                                            return
        }

        XCTAssertTrue(TreeValidator.isValid(node: node))
    }

    func testTreeValidatorTree5381749() {
        let testBundle = Bundle(for: type(of: self))

        guard let node = TreeBuilder.tree(bundle: testBundle,
                                          fileName: "tree5381749",
                                          fileExtension: "json") else {
                                            XCTFail()
                                            return
        }

        XCTAssertFalse(TreeValidator.isValid(node: node))
    }

    func testTreeValidatorTreeValidBST4Levels() {
        let testBundle = Bundle(for: type(of: self))

        guard let node = TreeBuilder.tree(bundle: testBundle,
                                          fileName: "treeValidBST4Levels",
                                          fileExtension: "json") else {
                                            XCTFail()
                                            return
        }

        XCTAssertTrue(TreeValidator.isValid(node: node))
    }

    func testTreeValidatorTreeInvalidBST4Levels() {
        let testBundle = Bundle(for: type(of: self))

        guard let node = TreeBuilder.tree(bundle: testBundle,
                                          fileName: "treeInvalidBST4Levels",
                                          fileExtension: "json") else {
                                            XCTFail()
                                            return
        }

        XCTAssertFalse(TreeValidator.isValid(node: node))
    }

}
