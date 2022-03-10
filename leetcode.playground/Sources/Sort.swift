import Foundation

/// 实现快速排序算法
// 1.输入一个 list, left, right. 递归调用
//  1.0 设置函数出口，left == right 退出。
// 2.定义两个哨兵 i = left，j = right.
// 3.循环移动哨兵，直到相碰
//    3.1 j往前移动，找到 list[j] <= list[0]
//    3.2 i往后移动，找到 list[i] >= list[0]
//    3.3 如果 i < j 的话，交换 i,j 两个数，j--
// 4.哨兵和基位交换,list[left] 和 list[i] 交换
// 5.分别对基位左/右两边进行以上重复操作，直到left == right

private func _quickSort<T: Comparable>(_ list: inout [T], left: Int, right: Int) {
    guard left < right else { return }
    
    let base = list[left]
    var i = left, j = right
    while i < j {
        // 先移动右边哨兵
        while list[j] >= base, i < j { j -= 1 }
        // 再移动左边哨兵
        while list[i] <= base, i < j { i += 1 }
        
        // 哨兵没有相碰，交换后移动右边哨兵
        if i < j {
            let temp = list[i]
            list[i] = list[j]
            list[j] = temp
            j -= 1
        }
    }
    list[left] = list[i]
    list[i] = base
    
    _quickSort(&list, left: left, right: i-1)
    _quickSort(&list, left: i + 1, right: right)
}


// MARK: - 测试

/// 快速排序提供接口
/// - Parameters:
///   - list: 需要排序的数据
///   - return: 已经排好序的数据
public func quickSort<T: Comparable>(_ list: [T]) -> [T] {
    var result = list
    _quickSort(&result, left: 0, right: list.count - 1)
    return result
}


// MARK: - 测试

/// 测试快速排序
/// - Parameters:
///   - list: 需要排序的数据
public func testQuickSort<T: Comparable>(_ list: [T]) {
    let result = quickSort(list)
    print("input: \(list)".begin("快速排序"))
    print("ouput: \(result)\n".end)
    sleep(10)
}

