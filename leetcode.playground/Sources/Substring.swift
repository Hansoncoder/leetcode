import Foundation

/**
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 ----------------------------------------------------

 给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。
 -------------------------------
 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 -------------------------------
 */

/// 伪代码
// 1.四个变量
//    temp:[char:Int] = [:] 保存字符最后出现位置
//    maxLength: Int = 0 无重复子串的最大长度
//    start: Int = 0 存储最新无重复字符串的开始位置
//    end: Int = 0 存储当前遍历到的位置
// 2.遍历字符串，取出s[end]字符char
//    2.1 查找字符上一次出现位置 pre = temp[char]
//    2.2 如果找到 pre，并且pre在最新的无重复子串区间[start : end]
//    2.2.1 移动 start 到 pre下一个位置，确保[start : end]区间无重复
//    2.3 maxLength = max(maxLength, (end - start) + 1)
//    2.4 存储最新的字符下标dict[char] = end
// 3. 遍历结束，返回 maxLength

public func lengthOfLongestSubstring(_ s: String) -> Int {
    var temp: [Character: Int] = [:]
    var maxLent = 0, start = 0, end = 0

    s.forEach { char in
        let preIndex = temp[char] ?? -1
        if preIndex > 0, preIndex >= start {
            start = preIndex + 1
        }
        maxLent = max(maxLent, (end - start) + 1)
        temp[char] = end
        end += 1
    }
    return maxLent
}

// MARK: - 测试

/// 测试无重复子串长度
/// - Parameters:
///   - count: 测试用例个数
///   - length: 测试子串长度
public func testLengthOfLongestSubstring(_ count: Int = 3, length: Int = 8) {
    print("".begin("lengthOfLongestSubstring"))
    for _ in 0 ..< count {
        let testString = String.randomString(length: length)
        print("input: \(testString)")
        print("ouput: \(lengthOfLongestSubstring(testString))\n")
    }
    print("-------------------".end)
}
