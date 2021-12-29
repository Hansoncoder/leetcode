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
