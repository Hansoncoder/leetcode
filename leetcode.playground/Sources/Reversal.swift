import Foundation

public final class ListNode<T> {
    public let value: T
    public var next: ListNode?
    public init(value: T) { self.value = value }
    
    public init(_ value: T) { self.value = value; next = nil }
    public init(_ value: T, _ next: ListNode?) {
        self.value = value;
        self.next = next
    }
    
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

    public func allValue() -> [T] {
        var temp: ListNode? = self
        var resultList: [T] = []
        while temp != nil {
            temp.flatMap { resultList.append($0.value) }
            temp = temp?.next
        }
        return resultList
    }
    
    public func printAllValue() {
        print("ListNode".begin("单链表输出"))
        print("ouput:\(allValue())".end)
    }
}

// 0.输入单链表，l1
// 1.定义两个指针, pre = l1, current = l1.next
// 2.清空 pre 的 next 指针. pre.next = nil
// 3.while 循环 l1 链表，直到 current != nil
// 3.1 定义临时指针temp，temp = current->next
// 3.2 指针反转，current->next = pre
// 3.3 指针下移. pre = current, current = next
// 4.返回 pre 指针

public func reverseList<T>(list: ListNode<T>) -> ListNode<T> {
    var currentNode = list.next
    var preNode = list
    preNode.next = nil
    
    var nextNode: ListNode<T>?
    while currentNode != nil {
        // 保存下一个节点
        nextNode = currentNode?.next
        // 指针反转
        currentNode?.next = preNode
        
        // 指针下移
        preNode = currentNode!
        currentNode = nextNode
    }
    return preNode
}


public func testReverseListNode<T>(_ list: [T]) {
    let l1 = ListNode<Int>.createNode(list)
    let result = reverseList(list: l1)
    
    // 输出结果
    print("input:\(list)".begin("链表反转"))
    print("ouput:\(result.allValue())".end)
}

