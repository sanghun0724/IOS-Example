import UIKit


func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    print(zip(arr1, arr2))
    print(zip(arr1, arr2).map{zip($0,$1)})
    
}


