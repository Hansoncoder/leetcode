import Foundation

public final class TreeNode<T> {
    public let value: T
    public var left: TreeNode?
    public var right: TreeNode?
    public init(value: T) { self.value = value }
}

// MARK: - 二叉排序树创建
extension TreeNode {
    
    /// 创建二叉排序树
    /// 搜索插入节点伪代码
    /// searchNode(node,key) -> Node {
    ///   var temp = node
    ///   while temp.left != nil || temp.right != nil {
    ///        if temp.value < key {
    ///             temp = temp.left
    ///             continue
    ///         } else {
    ///             temp = temp.right
    ///             continue
    ///         }
    ///       break
    ///    }
    ///    returm temp
    ///}
    private static func searchNode<T: Comparable>(node: TreeNode<T>, value: T) -> TreeNode<T> {
        var temp = node
        while temp.left != nil || temp.right != nil {
            if value < temp.value {
                if let left = temp.left {
                    temp = left
                    continue
                }
            } else {
                if let right = temp.right {
                    temp = right
                    continue
                }
            }
            break
        }
        return temp
    }
    
    /// 创建二叉排序树
    public static func createTree<T: Comparable>(_ list: [T]) -> TreeNode<T>? {
        guard list.count > 1 else { return nil }

        let head = TreeNode<T>(value: list.first!)
        var temp = head
        for index in 1 ..< list.count {
            let value = list[index]
            // 查找插入节点
            temp = searchNode(node: head, value: value)
            // 创建插入节点
            if value <= temp.value {
                temp.left = TreeNode<T>(value: value)
            } else {
                temp.right = TreeNode<T>(value: value)
            }
        }
        return head
    }
}

// MARK: - 二叉树遍历
extension TreeNode {
    /// 排序树的有序输出
    public func printInorder() {
        print(orders())
    }
    
    public func orders() -> [Any] {
        /// 使用中序遍历，可以输出有序的序列
        return getInorder()
    }
    
    /// 先序遍历(对于排序树，先序是乱序的)
    public func getPreorder() -> [Any] {
        outputList = []
        printPreorderTree(self)
        return outputList
    }
    /// 中序遍历(排序树，只有中序是有序的)
    public func getInorder() -> [Any] {
        outputList = []
        printInorderTree(self)
        return outputList
    }
    /// 后序遍历(对于排序树，后序是乱序的)
    public func printPostorder() -> [Any] {
        outputList = []
        printPostorderTree(self)
        return outputList
    }
}

// MARK: - 递归实现
/// 先序遍历(对于排序树，先序是乱序的)
public func printPreorderTree<T>(_ tree: TreeNode<T>?) {
    guard let tree = tree else { return }
    outputList.append(tree.value)
    printPreorderTree(tree.left)
    printPreorderTree(tree.right)
}

/// 中序遍历(排序树，只有中序是有序的)
public func printInorderTree<T>(_ tree: TreeNode<T>?) {
    guard let tree = tree else { return }

    printInorderTree(tree.left)
    outputList.append(tree.value)
    printInorderTree(tree.right)
}

/// 后序遍历(对于排序树，后序是乱序的)
public func printPostorderTree<T>(_ tree: TreeNode<T>?) {
    guard let tree = tree else { return }

    printPostorderTree(tree.left)
    printPostorderTree(tree.right)
    outputList.append(tree.value)
}

var outputList:[Any] = []
public func testCreatBinaryTree<T: Comparable>(_ list:[T]) {
    print("Input:\(list)".begin("创建二叉排序树,中序遍历输出"))
    let node = TreeNode<T>.createTree(list)
    let result = node?.getInorder()
    print("Output:\(result ?? [])".end)
}
