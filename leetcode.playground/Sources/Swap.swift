import Foundation

// MARK: - 算法

/// 位运算交换两个数
/// - Parameters:
///   - first: 第一个数
///   - last: 第二个数
fileprivate func bitSwap(_ first: inout Int, _ last: inout Int) {
    first ^= last // 10001 ^ 10000 = 00001
    last ^= first // 10000 ^ 00001 = 10001
    first ^= last // 00001 ^ 10001 = 10000
}

// MARK: - 测试

/// 测试位运算交换
public func testBitSwap(first: Int, last: Int) {
    var a = first, b = last
    print("input:(\(a),\(b))".begin("bit"))

    bitSwap(&a, &b)

    print("output:(\(a),\(b))".end)
}

// MARK: - 算法

// MARK: - 使用元组

/// - Parameters:
///   - first: 第一个数
///   - last: 第二个数
/// - Returns: 结果
fileprivate func tupleSwap<T>(_ pre: (T, T)) -> (T, T) {
    return (pre.1, pre.0)
}

// MARK: - 测试

/// 测试元组交换
public func testTupleSwap<T>(first: T, last: T) {
    let tuple = (first, last)
    print("input:\(tuple)".begin("tuple"))

    let result = tupleSwap(tuple)

    print("output:\(result)".end)
}
