//
//  CyclicPermutation.swift
//  ProblemSet2
//
//  Created by Esperanza on 2022-03-28.
//

import Foundation

// find cycle
func cyclicPermutation() {
  // input 3 2 7 8 1 4 5 6
  // n = Test Cases
  let n = Int(readLine()!)!
  // go through each case, each case has num of items and sequence of Int
  for _ in 0..<n {
    let nums = Int(readLine()!)!
    let firstLine = readLine()!.split(separator: " ")
//    print(firstLine) -> ["3", "2", "7", "8", "1", "4", "5", "6"]
    var count = 0
    
    var adjlist = [[Int]](repeating: [], count: nums + 1)
    var visited = [Bool](repeating: false, count: nums + 1)
    
    for i in 0..<firstLine.count {
      adjlist[i + 1].append(Int(firstLine[i])!)
    }
//    print(adjlist)
    
    for i in 1..<adjlist.count {
      if !visited[i] {
        count += dfs(start: i, adjlist: &adjlist, visited: &visited)
      }
    }
    print(count)
  }
 
  func dfs(start: Int, adjlist: inout [[Int]], visited: inout [Bool]) -> Int {
    visited[start] = true
    // base case
    if visited[adjlist[start][0]] {
//      print([adjlist[start]])
      return 1
    }
    // recursive case
    return dfs(start: adjlist[start][0], adjlist: &adjlist , visited: &visited)
  }
  
}
//2
//8
//3 2 7 8 1 4 5 6
//10
//2 1 3 4 5 6 7 9 10 8

