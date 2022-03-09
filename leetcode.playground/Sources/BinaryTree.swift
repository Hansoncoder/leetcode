import Foundation

public final class TreeNode<T> {
    public let value: T
    public var left: TreeNode?
    public var right: TreeNode?
    public init(value: T) { self.value = value }
}

// MARK: - 二叉排序树创建
extension TreeNode {
    /// 创建二叉树的节点
    private static func creatNote<T: Comparable>(_ tree: TreeNode<T>, value: T) {
        if value <= tree.value {
            tree.left = TreeNode<T>(value: value)
        } else {
            tree.right = TreeNode<T>(value: value)
        }
    }
    
    /// 创建二叉排序树
    public static func createTree<T: Comparable>(_ list: [T]) -> TreeNode<T>? {
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
}

// MARK: - 二叉树遍历
extension TreeNode {
    /// 排序树的有序输出
    public func printOrder() {
        /// 使用中序遍历，可以输出有序的序列
        printInorder()
    }
    
    /// 先序遍历(对于排序树，先序是乱序的)
    public func printPreorder() {
        printPreorderTree(self)
    }
    /// 中序遍历(排序树，只有中序是有序的)
    public func printInorder() {
        printInorderTree(self)
    }
    /// 后序遍历(对于排序树，后序是乱序的)
    public func printPostorder() {
        printPostorderTree(self)
    }
}

// MARK: - 递归实现
/// 先序遍历(对于排序树，先序是乱序的)
public func printPreorderTree<T>(_ tree: TreeNode<T>?) {
    guard let tree = tree else { return }
    print(tree.value)
    printPreorderTree(tree.left)
    printPreorderTree(tree.right)
}

/// 中序遍历(排序树，只有中序是有序的)
public func printInorderTree<T>(_ tree: TreeNode<T>?) {
    guard let tree = tree else { return }

    printInorderTree(tree.left)
    print(tree.value)
    printInorderTree(tree.right)
}

/// 后序遍历(对于排序树，后序是乱序的)
public func printPostorderTree<T>(_ tree: TreeNode<T>?) {
    guard let tree = tree else { return }

    printPostorderTree(tree.left)
    printPostorderTree(tree.right)
    print(tree.value)
}

