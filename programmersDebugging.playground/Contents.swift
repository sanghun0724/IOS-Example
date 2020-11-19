import UIKit


func solution(_ num:Int) -> Int {
  var count = 0
  var number = num
    while number > 1 {
    number % 2 == 0 ? (number = number / 2) : (number = number * 3 + 1)
        count+=1
        
    }
    
    return count >= 500 ? -1 : count
}
    


