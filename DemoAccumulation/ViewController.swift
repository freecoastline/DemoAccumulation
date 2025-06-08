//
//  ViewController.swift
//  DemoAccumulation
//
//  Created by ken on 2025/6/7.
//

import UIKit

class ViewController: UIViewController {

    let inputArray:[Any] = [true, 0, false, 1, 1, "ddd"]
    
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
    }


}

