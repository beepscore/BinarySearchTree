//
//  TreeBuilderTests.swift
//  BinarySearchTreeTests
//
//  Created by Steve Baker on 10/20/18.
//  Copyright © 2018 Beepscore LLC. All rights reserved.
//

import XCTest
@testable import BinarySearchTree

class TreeBuilderTests: XCTestCase {

    func testTreeBuilderTree314() {
        let testBundle = Bundle(for: type(of: self))

        guard let node = TreeBuilder.tree(bundle: testBundle,
                                          fileName: "tree314",
                                          fileExtension: "json") else {
                                            XCTFail()
                                            return
        }

        XCTAssertEqual(node.value, 3)
        XCTAssertEqual(node.left?.value, 1)
        XCTAssertEqual(node.right?.value, 4)

        XCTAssertNil(node.left?.left)
        XCTAssertNil(node.left?.right)
        XCTAssertNil(node.right?.left)
        XCTAssertNil(node.right?.right)
    }


}
