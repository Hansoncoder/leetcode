import Foundation

// MARK: - 算法
// 0.输入单链表，l1
// 1.定义两个指针, pre = l1, current = l1.next
// 2.清空 pre 的 next 指针. pre.next = nil
// 3.while 循环 l1 链表，直到 current != nil
//   3.1 定义临时指针temp，temp = current->next
//   3.2 指针反转，current->next = pre
//   3.3 指针下移. pre = current, current = next
// 4.返回 pre 指针

// 时间复杂度为 O(N)
// 空间复杂度为O(1)
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


// MARK: - 辅助测试
public func testReverseListNode<T>(_ list: [T]) {
    let l1 = ListNode<Int>.createNode(list)
    let result = reverseList(list: l1)
    
    // 输出结果
    print("input:\(list)".begin("链表反转"))
    print("output:\(result.allValue())".end)
}
