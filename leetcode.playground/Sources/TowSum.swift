import Foundation

/**
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

 你可以按任意顺序返回答案。

 -------------------------------
 输入：nums = [2,7,11,15], target = 9
 输出：[0,1]
 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。
 -------------------------------
 */

// MARK: - 算法

public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count >= 2 else {
        return []
    }
    var tempHash: [Int: Int] = [:]
    for (index, value) in nums.enumerated() {
        if let nextIndex = tempHash[target - value] {
            return [index, nextIndex]
        }
        tempHash[value] = index
    }
    return []
}

// MARK: - 测试辅助

public func testTwoSum(_ nums: [Int], _ target: Int) {
    print("input:\(nums)  \ninput: \(target)".begin("两数和寻找"))
    let result = twoSum(nums, target)
    print("ouput:\(result)".end)
}

/**
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

  -------------------------------
  输入：l1 = [2,4,3], l2 = [5,6,4]
  输出：[7,0,8]
  解释：342 + 465 = 807.
  -------------------------------
 */

// MARK: -  算法

public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard l1 != nil, l2 != nil else {
        return nil
    }

    var first = l1, last = l2
    var value = first!.val + last!.val
    var bit: Int = 0
    let newList: ListNode? = ListNode(value % 10)
    var tempNode: ListNode? = newList
    while first?.next != nil || last?.next != nil {
        bit = value / 10
        first = first?.next
        last = last?.next
        value = bit + (first?.val ?? 0) + (last?.val ?? 0)
        tempNode?.next = ListNode(value % 10)
        tempNode = tempNode?.next
    }

    if value >= 10 {
        tempNode?.next = ListNode(value / 10)
    }

    return newList
}

// MARK: - 测试辅助

/// 辅助声明
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

/// 测试用例格式转化
public func testAddTwoNumbers(_ first: [Int], _ last: [Int]) {
    guard first.count > 1 && last.count > 1 else {
        print("请确保两个数组都有值")
        return
    }

    /// 创建链表
    let node = createNode(first, last)

    /// 调用算法
    var result = addTwoNumbers(node.0, node.1)

    /// 输出结果
    var resultList: [Int] = []
    while result != nil {
        resultList.append(result!.val)
        result = result?.next
    }
    print("input:\(first)".begin("链表相加"))
    print("input:\(last)")
    print("ouput:\(resultList)".end)
}

fileprivate func createNode(_ first: [Int], _ last: [Int]) -> (ListNode?, ListNode?) {
    let l1 = ListNode(first.first!)
    let l2 = ListNode(last.first!)
    let firstIsMin = first.count < last.count
    let maxCount = min(first.count, last.count)

    var firstNode: ListNode? = l1
    var lastNode: ListNode? = l2
    for i in 1 ..< maxCount {
        firstNode?.next = ListNode(first[i])
        lastNode?.next = ListNode(last[i])
        firstNode = firstNode?.next
        lastNode = lastNode?.next
    }

    var tempNode = firstIsMin ? firstNode : lastNode
    let tempList = firstIsMin ? last : first
    for i in maxCount ..< max(first.count, last.count) {
        tempNode?.next = ListNode(tempList[i])
        tempNode = tempNode?.next
    }

    return (l1, l2)
}
