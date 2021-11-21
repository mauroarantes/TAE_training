import UIKit

func f1 (_ list: [String]) -> String {
     
     var i: Int = 0
     var match = ""
     var b1 = true
     var compare: Character
     
     for each in list {
         
         /*if each[each.index(each.startIndex, offsetBy: i)] == "" {
             b1 = false
             break
         }
         else {
             let compare = each[each.index(each.startIndex, offsetBy: i)]
         }*/
         
//         let compare = each[each.index(each.startIndex, offsetBy: i)]
         
         if  each.index(each.startIndex, offsetBy: i, limitedBy: each.endIndex) != nil {
             compare = each[each.index(each.startIndex, offsetBy: i)]
         }
         else {
             b1 = false
             break
         }
         
//         print(compare)
         
         for each in list {
             if compare != each[each.index(each.startIndex, offsetBy: i)] {
                 b1 = false
                 break
             }
         }
         
         if b1 {
             match += String(compare)
             i += 1
         }
         else {
             break
         }

     }
     return match
}

let strs = ["tt1", "tt2", "tt3", "tt"]
var b2 = true

for each in strs {
    if  each.isEmpty {
        print("There is an empty string.")
        b2 = false
    }
}

if b2 {
    let s1 = f1(strs)
    print(s1)
}
