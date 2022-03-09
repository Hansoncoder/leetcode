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

public func addTwoNumbers(_ l1: ListNode<Int>, _ l2: ListNode<Int>) -> ListNode<Int> {
    
    var first: ListNode<Int>? = l1
    var last: ListNode<Int>? = l2
    // 第一位相加,创建头节点
    var value = first!.value + last!.value
    var bit: Int = 0
    let newList: ListNode<Int> = ListNode(value % 10)
    
    // 接下来后面几位相加
    var tempNode: ListNode? = newList
    while first?.next != nil || last?.next != nil {
        bit = value / 10
        first = first?.next
        last = last?.next
        value = bit + (first?.value ?? 0) + (last?.value ?? 0)
        tempNode?.next = ListNode(value % 10)
        tempNode = tempNode?.next
    }

    // 最后一位判断是否进位
    if value >= 10 {
        tempNode?.next = ListNode(value / 10)
    }

    return newList
}

// MARK: - 测试辅助

/// 测试用例格式转化
public func testAddTwoNumbers(_ first: [Int], _ last: [Int]) {
    guard first.count > 1 && last.count > 1 else {
        print("请确保两个数组都有值")
        return
    }

    // 创建链表
    let l1 = ListNode<Int>.createNode(first)
    let l2 = ListNode<Int>.createNode(last)
    
    // 调用算法
    let result = addTwoNumbers(l1, l2)
    
    // 输出结果
    print("input:\(first)".begin("链表相加"))
    print("input:\(last)")
    print("ouput:\(result.allValue())".end)
}
