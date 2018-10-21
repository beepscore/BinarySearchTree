//
//  FileUtilsTests.swift
//  BinarySearchTreeTests
//
//  Created by Steve Baker on 10/20/18.
//  Copyright © 2018 Beepscore LLC. All rights reserved.
//

import XCTest
@testable import BinarySearchTree

class FileUtilsTests: XCTestCase {

    func testStringFromFile() {

        // https://stackoverflow.com/questions/25596702/swift-get-nsbundle-for-test-target
        let testBundle = Bundle(for: type(of: self))

        let actual = FileUtils.string(bundle: testBundle, fileName: "tree5", fileExtension: "json")

        let expected = "{ \"value\": 5, \"left\": null, \"right\": null }"

        XCTAssertEqual(actual, expected)
    }

}
