# Purpose
Build binary trees, add methods to check if they are valid binary search trees.

# References
write app without referencing any sources except for Appendix- notes.

## Appendix- notes

# Results
See code

## Appendix- notes

Assume a BST is defined as follows:
- The left subtree of a node contains only nodes with keys less than the node's key.
- The right subtree of a node contains only nodes with keys greater than the node's key.
- Both the left and right subtrees must also be binary search trees.
all nodes are unique

Input:
     5
   /   \
  3     8
 1 4  6  9
Output: true

Input:
     5
   /   \
  3     8
 1 7  4  9
Output: false

enum TreeType {
     .left
     .right
}

class Node {

    var value: Int
    var left: Node?
    var right: Node?
    var nodeType: TreeType

    init(value: Int, nodeType: TreeType, left: Node?, right: Node?) {
        self.value = value
        self.nodeType = nodeType
        self.left = left
        self.right = right
    }
}


static func isValid(tree: Node?, ancestorsMinValue: Int, ancestorsMaxValue: Int, treeType: TreeType ) -> Bool {

    if tree == nil { return true }

    if ((tree.left != nil) && (tree.left?.value >= tree.value || tree.left?.value >= ancestorsMaxValue ))
        || ((tree.right != nil) && tree.right.value <= tree.value || tree.right?.value <= ancestorsMinValue )) { return false }

    return isValid(left) && isValid(right)

}

static func isValid(tree: Node?, ancestorsMinValue: Int, ancestorsMaxValue: Int) -> Bool {

    if tree == nil { return true }

    if tree.nodeType == .left && tree.value >= ancestorsMinValue { return false }
    if tree.nodeType == .right && tree.value <= ancestorsMaxValue { return false }

    return isValid(tree.left, ancestorsMinValue: min(tree.value, ancestorsMinValue), ancestorsMaxValue: max(tree.value, ancestorsMaxValue))
        && isValid(tree.right, ancestorsMinValue: min(tree.value, ancestorsMinValue), ancestorsMaxValue: max(tree.value, ancestorsMaxValue))
}

