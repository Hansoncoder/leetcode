import Foundation

// MARK: - 定义单链表
public final class ListNode<T> {
    public let value: T
    public var next: ListNode?
    public init(value: T) { self.value = value }
    
    public init(_ value: T) { self.value = value; next = nil }
    public init(_ value: T, _ next: ListNode?) {
        self.value = value;
        self.next = next
    }
}

// MARK: - create node from list
extension ListNode {
    // 输入一个数组，创建一个单链表
    public static func createNode<T>(_ list: [T]) -> ListNode<T> {
        guard list.count > 1 else {
            fatalError("please input values")
        }

        let tree = ListNode<T>(value: list.first!)
        var temp = tree
        for i in 1..<list.count {
            let next = ListNode<T>(value: list[i])
            temp.next = next
            temp = next
        }
        return tree
    }
}

// MARK: - print value
extension ListNode {
    
    /// 将单链表中的所有value，放到数组中返回
    public func allValue() -> [T] {
        var temp: ListNode? = self
        var resultList: [T] = []
        while temp != nil {
            temp.flatMap { resultList.append($0.value) }
            temp = temp?.next
        }
        return resultList
    }
    
    /// 打印单链表中的value
    public func printAllValue() {
        print("ListNode".begin("单链表输出"))
        print("output:\(allValue())".end)
    }
}
