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

}
