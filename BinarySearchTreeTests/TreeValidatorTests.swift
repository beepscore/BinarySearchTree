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

        XCTAssertTrue(TreeValidator.isValid(tree: node, nodeType: .root,
                                            ancestorsMinValue: 0,
                                            ancestorsMaxValue: 0))
    }

    func testTreeValidatorTree314() {
        let testBundle = Bundle(for: type(of: self))

        guard let node = TreeBuilder.tree(bundle: testBundle,
                                          fileName: "tree314",
                                          fileExtension: "json") else {
                                            XCTFail()
                                            return
        }

        XCTAssertTrue(TreeValidator.isValid(tree: node, nodeType: .root,
                                            ancestorsMinValue: 0,
                                            ancestorsMaxValue: 0))
    }

    // TODO: fix isValid so test passes
    func testTreeValidatorTree5381469() {
        let testBundle = Bundle(for: type(of: self))

        guard let node = TreeBuilder.tree(bundle: testBundle,
                                          fileName: "tree5381469",
                                          fileExtension: "json") else {
                                            XCTFail()
                                            return
        }

        XCTAssertTrue(TreeValidator.isValid(tree: node, nodeType: .root,
                                            ancestorsMinValue: 0,
                                            ancestorsMaxValue: 0))
    }

}
