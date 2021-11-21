import UIKit

func f1(_ list: [Int], _ goal: Int) -> [Int] {
//    let i = list.count - 1
    for (index, item) in list.enumerated() {
        var i: [Int] = list
//        print(i, index)
        i.remove(at: index)
//        print(i)
        for (index1, item1) in i.enumerated() {
            ans = item + item1
//            print("Ans = ", ans)
            if ans == target {
                out.append(index)
                out.append(index1+1)
                return out
            }
        }
    }
    
    return []
}

let nums = [2, 7, 11, 15]
let target = 9
var ans: Int = 0
var out: [Int] = []

print(f1(nums, target))
