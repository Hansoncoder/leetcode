import Foundation

extension String {
    public func begin(_ title: String = "begin") -> String {
        return "-----------\(title)------------\n" + self
    }

    public var end: String {
        if contains("-----") {
            return "\n--------------\(self)-------------\n"
        }
        return self + "\n---------------------------\n"
    }
}

/// 随机字符串生成
extension String {
    public static func randomString(length: Int) -> String {
        let letters: NSString = "abcde"
        let len = UInt32(letters.length)
        var randomString = ""

        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }

        return randomString
    }
}
