import Foundation

/**
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。
 
 -------------------------------
 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 -------------------------------
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    var temp: [Character : Int] = [:]
    var maxLent = 0
    var starIndex = 1
    var endIndex = 1
    s.forEach { char in
        let preIndex = temp[char] ?? 0
        if preIndex > 0, preIndex >= starIndex {
            starIndex = preIndex + 1
        }
        maxLent = max(maxLent, ((endIndex - starIndex) + 1))
        temp[char] = endIndex
        endIndex += 1
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
    for _ in 0..<count {
        let testString = randomString(length: length)
        print("input: \(testString)")
        print("ouput: \(lengthOfLongestSubstring(testString))\n")
    }
    print("-------------------".end)
}

/// 随机字符串生成
func randomString(length: Int) -> String {
    let letters : NSString = "abcde"
    let len = UInt32(letters.length)
    var randomString = ""
    
    for _ in 0 ..< length {
        let rand = arc4random_uniform(len)
        var nextChar = letters.character(at: Int(rand))
        randomString += NSString(characters: &nextChar,length: 1) as String
    }
    
    return randomString
}
