//
//  ViewController.swift
//  DemoAccumulation
//
//  Created by ken on 2025/6/7.
//

import UIKit

class ViewController: UIViewController {

    let inputArray:[Any] = [true, 0, false, 1, 1, "ddd"]
    let stringArray = ["The", "quick", "brown", "fox", "jumped", "over", "the", "lazy", "dog", "brown"]
    
    
    func bubbleSort(_ inputArray: [Int]) -> [Int] {
        guard inputArray.count > 1 else {
            return inputArray
        }
        
        var sortedArray = inputArray
        var isSorting = false
        repeat {
            isSorting = false
            for index in stride(from: 1, to: sortedArray.count, by: 1) {
                if sortedArray[index] > sortedArray[index - 1] {
                    sortedArray.swapAt(index, index - 1)
                    isSorting = true
                }
            }
        } while isSorting
        return sortedArray
    }
    
    func findBools(_ array: [Any]) -> [Any] {
        array.compactMap { $0 as? Bool}
    }
    
    func divideArray(_ inputArray:[Any], chunkSize:Int) -> [Any] {
        let chunks = stride(from: 0, to: inputArray.count, by: chunkSize).map {
            Array(inputArray[$0..<min($0 + chunkSize, inputArray.count)])
        }
        return chunks
    }
    
    
    func getEveryNth(_ nth: Int, arr: [Any]) {
        var everyNthArray = [Any]()
        var shiftedArray = arr
        shiftedArray.insert(0, at: 0)
        
        for (i, element) in shiftedArray.enumerated() {
            if i > 0 && i.isMultiple(of: nth) {
                everyNthArray.append(element)
            }
        }
        print(everyNthArray)
    }
    
    func dropLastfewElements<T:Any> (with arr:[T], while predicate: (T) -> Bool) {
        var droppedArray = arr
        for element in droppedArray.reversed() {
            if !predicate(element) { break }
            droppedArray =  droppedArray.dropLast()
        }
        print(droppedArray)
    }
    
    func countOccurenceOfString(_ arr: [String], into: String) -> Int {
        arr.reduce(0) { $1 == into ? $0 + 1 : $0 }
    }
    
    func deepFlattenArray(_ arr: [Any]) {
        var flattenedArray = [Any]()
        for element in arr {
            if let element = element as? Int {
                flattenedArray.append(element)
            }
            if let element = element as? [Any] {
                for i in element {
                    if let i = i as? Int {
                        flattenedArray.append(i)
                    }
                }
            }
        }
        print(flattenedArray)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(bubbleSort([1,2,3,5,4]))
        print("======")
        print(findBools(inputArray))
        print("======")
        print(divideArray(inputArray, chunkSize: 2))
        print("======")
        getEveryNth(2, arr: ["The", "quick", "brown", "fox", "jumped", "over", "the", "lazy", "dog"])
        print("======")
        dropLastfewElements(with: [1, 2, 3, 4, 5, 6], while: { $0 > 3})
        dropLastfewElements(with: ["The", "quick", "brown", "fox", "jumped", "over", "the", "lazy", "dog", "lazy"], while: { $0.count > 3})
        print("======")
        print(countOccurenceOfString(stringArray, into: "brown"))
        print("======")
        deepFlattenArray([6, 5, 4, [3, 2], [1]])
        
    }


}

