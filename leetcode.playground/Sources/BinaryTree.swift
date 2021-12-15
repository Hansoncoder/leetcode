import Foundation

public final class TreeNode<T> {
    public let value: T
    public var left: TreeNode?
    public var right: TreeNode?
    public init(value: T) { self.value = value }
}

fileprivate func creatNote<T: Comparable>(_ tree: TreeNode<T>, value: T) {
    if value <= tree.value {
        tree.left = TreeNode<T>(value: value)
    } else {
        tree.right = TreeNode<T>(value: value)
    }
}

public func createTree<T: Comparable>(_ list: [T]) -> TreeNode<T>? {
    guard list.count > 1 else { return nil }

    let tree = TreeNode<T>(value: list.first!)
    var leaf = tree
    for index in 1 ..< list.count {
        let value = list[index]
        leaf = tree
        while leaf.left != nil || leaf.right != nil {
            if value <= leaf.value {
                if let left = leaf.left {
                    leaf = left
                    continue
                }
            } else if let right = leaf.right {
                leaf = right
                continue
            }
            break
        }
        creatNote(leaf, value: value)
    }
    return tree
}

/// 打印内容
public func printTree<T>(_ tree: TreeNode<T>?) {
    guard let tree = tree else { return }

    printTree(tree.left)
    print(tree.value)
    printTree(tree.right)
}
