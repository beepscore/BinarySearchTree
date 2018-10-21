//
//  TreeBuilder.swift
//  BinarySearchTree
//
//  Created by Steve Baker on 10/20/18.
//  Copyright © 2018 Beepscore LLC. All rights reserved.
//

import Foundation

class TreeBuilder {
    
    /// - Parameters:
    ///   - bundle: typically unit test bundle
    ///   - fileName: name of data file
    ///   - fileExtension: typically .json
    /// - Returns: a tree of nodes matching structure in file json text.
    ///            The tree may or may not be a valid binary search tree
    static func tree(bundle: Bundle, fileName: String, fileExtension: String) -> Node? {
        
        guard let jsonString = FileUtils.string(bundle: bundle,
                                                fileName: fileName,
                                                fileExtension: fileExtension) else {
                                                    return nil
        }
        
        guard let jsonData = jsonString.data(using: .utf8) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        guard let node = try? decoder.decode(Node.self, from: jsonData) else {
            return nil
        }
        
        return node
    }
    
}
