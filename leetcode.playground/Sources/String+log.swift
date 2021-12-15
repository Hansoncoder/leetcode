import Foundation


extension String {
    public func begin(_ title: String = "begin") -> String {
        return "-----------\(title)------------\n" + self
    }
    
    public var end: String {
        return self + "\n---------------------------\n"
    }
}
