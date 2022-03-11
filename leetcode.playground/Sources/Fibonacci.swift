import Foundation

/// 斐波那契数列
// 函数式：f(n) = f(n-1) + f(n-2),
// 其中 f(1) = 1 f(2) = 1

//MARK: -  递归求解
// 时间复杂度为 O(2^n)
// 空间复杂度为O(1)
public func fibonacciFromRecursive(_ n: Int) -> Int64 {
    if n == 1 || n == 2 {
        return 1
    }
    return fibonacciFromRecursive(n-1) + fibonacciFromRecursive(n-2)
}

//MARK: -  动态规划
// 时间复杂度为 O(N)
// 空间复杂度为O(1)
public func fibonacciFromDynamic(_ n: Int) -> Int64 {
    var result: Int64 = 1
    var pre1: Int64 = 1
    var pre2: Int64 = 1
    for _ in 3 ... n {
        result = pre1 + pre2
        pre1 = pre2
        pre2 = result
    }
    return result
}

public func testFibonacci(_ n: Int) {
    print("input:\(n)".begin("单链表输出"))
    print("output:\(fibonacciFromDynamic(n))".end)
}
