//
//  ReaptingSquence.swift
//  ProblemSet2
//
//  Created by Esperanza on 2022-03-29.
//

import Foundation

func repeatSequence() {
  // if input 57, 2
  let firstLine = readLine()!.split(separator: " ")
  // first line = ["57", "2"]
//  print("first: \(firstLine)")
  // D[0] = a (1 <= a <= 9999)
  let a = String(firstLine[0])
  // a = "57"
  // the power of p ( 1 <= p <= 5)
  let p = String(firstLine[1])
  // p = "2"
  
  var nums: [Int] = []
 
  dfs(start: a)
  
  func dfs(start: String) {
    // base case: contain the same Int will stop
    if nums.contains(Int(start)!) {
      print(nums.firstIndex(of: Int(start)!)!)
//      print(start)
      return
    }
    // if not stop, append start to the array -> means doesn't contain this value
    nums.append(Int(start)!)
    
    // recursive case
    var sum: Int = 0
    for i in start {
  //    print(Int(String(i)))
      sum += (power(base: Int(String(i))!, exponent: Int(p)!))
//      print(sum)
    }
    dfs(start: String(sum))
  }
//  print(nums)
  
  func power(base: Int, exponent: Int) -> Int {
   // base case
   if exponent == 0 {
    return 1
   }
   // recursive case
   return power(base: base, exponent: exponent - 1) * base
  }
}
