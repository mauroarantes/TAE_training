import UIKit

func reverse(_ y: Int) -> Int {
    
    var i = 1
    var sign = 1
    var ans = 0
    var x = abs(y)
    if x < 0 {
       sign = -1
    }
    while x > 0 {
//        print("i = ", i)
        ans *= 10
        ans += x%10
        x /= 10
        i += 1
    }
//    if y == ans*sign {
//        return i
//    } else {
//        reverse(ans*sign+y)
//        print("Ans = ", ans*sign+y)
//    }
    return ans*sign
}

var j = 1
var num = 7325
var rev = reverse(num)
var sum = num + rev
//print("Rev1 = ", rev)
//print("Sum = ", sum)
while sum != reverse(sum) {
    j += 1
    sum += reverse(sum)
}

print("Palindrome =", sum, ", after", j,  "iteractions.")
