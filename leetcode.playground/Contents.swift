import UIKit

var greeting = "Hello, playground"

///** 位运算交换 **/
testBitSwap(first: 10, last: 20)

/** 元组交换 **/
testTupleSwap(first: "aaa", last: "bbb")

/** 两数和寻找 **/
testTwoSum([1,2,5,4,9,6], 9)

/**  链表两数和 */
testAddTwoNumbers([9,9,9,9,9,9,9],[9,9,9,9])

/**  字符串 s的最长子串长度 */
testLengthOfLongestSubstring(2, length: 6)

/**  单链表反转 */
testReverseListNode([1,2,3,4,5])

let tree = TreeNode<Int>.createTree([1,2,5,3,2,1,6,4])
tree?.printOrder()

