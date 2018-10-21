//
//  FileUtils.swift
//  BinarySearchTree
//
//  Created by Steve Baker on 10/20/18.
//  Copyright © 2018 Beepscore LLC. All rights reserved.
//

import Foundation


class FileUtils {

    /// - Parameters:
    ///   - bundle: typically Bundle(for: type(of: self)). This works for callers in unit tests
    ///   - fileName: file name without extension e.g. "myFile"
    ///   - fileExtension: e.g. "json"
    /// - Returns: string from file. returns nil if can't read file
    /// https://stackoverflow.com/questions/24097826/read-and-write-a-string-from-text-file
    /// https://stackoverflow.com/questions/46763521/how-to-write-a-swift-4-encoded-json-to-a-file#46772209
    static func string(bundle: Bundle, fileName: String, fileExtension: String) -> String? {

        guard let fileURL = bundle.url(forResource: fileName, withExtension: fileExtension) else {
            return nil
        }

        var text = ""
        do {
            text = try String(contentsOf: fileURL, encoding: .utf8)
        }
        catch {
            print("\(error)")
        }

        // remove trailing newline \n
        let textTrimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        return textTrimmed
    }

}
