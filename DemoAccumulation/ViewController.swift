//
//  ViewController.swift
//  DemoAccumulation
//
//  Created by ken on 2025/6/7.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let inputArray:[Any] = [true, 0, false, 1, 1, "ddd"]
    let stringArray = ["The", "quick", "brown", "fox", "jumped", "over", "the", "lazy", "dog", "brown"]
    let IntArray = [6,5,4,3,2]
    
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
    
    
    func difference(_ arr1: [AnyHashable], arr2: [AnyHashable]) -> Set<AnyHashable>{
        Set(arr1).symmetricDifference(arr2)
    }
    
    func checkForDuplicates(_ arr:[AnyHashable]) -> Bool{
        arr.count != Set(arr).count
    }
    
    func insertionSort(_ arr: [Int]) {
        var a = arr
        for index in stride(from: 1, to: a.count, by: 1) {
            var y = index
            while y > 0 && a[y] < a[y - 1] {
                a.swapAt(y, y - 1)
                y -= 1
            }
        }
        print(a)
    }
    
    
    func randomChange(_ arr:[AnyHashable]) {
        var a = arr
        for index in stride(from: a.count - 1, through: 1, by: -1) {
            let i = Int.random(in: 0...index)
            if index != i {
                a.swapAt(i, index)
            }
        }
        print(a)
    }
    
    
    func calcMedian(_ arr:[Int]) {
        print(arr.sorted(by: <)[arr.count / 2])
    }
    
    
    func calAverage(_ arr:[Int]) {
        print(arr.reduce(0, +) / 2)
    }
    
    //gcd
    func gcd(num1: Int, num2: Int) -> Int {
        let mod = num1 % num2
        if mod != 0 {
            return gcd(num1: num2, num2: mod)
        }
        return num2
    }
    
    //lcm: least common multiple between two integers using gcd function above
    func lcm1(num1: Int, num2: Int) -> Int {
        return abs(num1 * num2) / gcd(num1: num1, num2: num2)
    }
    
    func lcm2(_ arr: [Int]) {
        print(arr.reduce(24) { lcm1(num1: $0, num2: $1) })
    }
    
    
    func maxn(_ arr: [Int]) {
        if let a = arr.max(by: <) {
            print(a)
        }
    }
    let combineVC = CombineTestViewController()
    
    func countVowels(_ str: String) {
        let vowels = Set(["a", "e", "i", "o", "u"])
        var count = 0
        for charactor in str {
            if vowels.contains("\(charactor)") {
                count += 1
            }
        }
        print(count)
    }
    
    func firstWordLowerCase(_ str: String) {
        var components = str.components(separatedBy: " ")
        components[0] = components[0].lowercased()
        print(components.joined(separator: " "))
    }
    
    
    func anagram(_ str1: String, str2: String) {
        var s1 = str1.filter {  !$0.isWhitespace }.lowercased()
        var s2 = str2.filter {  !$0.isWhitespace }.lowercased()
        print(s1.sorted() == s2.sorted())
    }
    
    func drop(_ arr:[AnyHashable], num:Int) {
        var array = arr
        print(array.dropFirst(num))
    }
    
    func csv(_ arr: [Array<String>]) {
        var result = ""
        for row in arr {
            result.append(row.map{ "\"\($0)\"" }.joined(separator: ",") + "\n")
        }
        print(result)
    }
    
    func flip<A, B, C>(_ function: @escaping ((A, B) -> C)) -> ((B, A) -> C) {
        return { (a, b) in
            return function(b, a)
        }
    }
    
    func concat(_ str1: String, str2: String) {
        print(str1 + str2)
    }
    
    func dropRight(_ arr: [Int], while predicate: (Int) -> (Bool)) {
        var tempArr = arr
        for i in tempArr.reversed() {
            if predicate(i) { break }
            tempArr = tempArr.dropLast()
        }
        print(tempArr)
    }
    
    func evertNthElement(_ arr: [Any], n: Int) {
        print(arr.enumerated().compactMap({
            ($0.offset + 1) % n == 0 ? $0.element : nil
        }))
    }
    
    func snake(_ str: String) {
        let pattern = "([a-z])([A-Z])"
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: str.count)
        //        print(regex?.stringByReplacingMatches(in: str, range: range, withTemplate: "$1_$2")
        //            .replacingOccurrences(of: " ", with: "_")
        //            .replacingOccurrences(of: "-", with: "_"))
        guard let matches = regex?.matches(in: str, range: range) else {
            return
        }
        for match in matches {
            guard let swiftrange = Range(match.range(at: 0), in: str) else {
                return
            }
            print(str[swiftrange])
        }
    }
    
    func filterNonUnique(_ arr:[Any]) {
        let set = NSOrderedSet(array: arr)
        print(set.array)
    }
    
    func isSortedArray(_ arr:[Int]) {
        var asc:Bool = true
        var prev = Int.min
        for elem in arr {
            if elem < prev {
                asc = false
                break;
            }
            prev = elem
        }
        
        var dec = true
        var prev1 = Int.max
        for elem in arr {
            if elem > prev1 {
                dec = false
                break
            }
            prev1 = elem
        }
        print("isasc: \(asc) isdec:\(dec)")
    }
    
    func isSortedArray2(_ arr:[Int]) {
        var sortedArr = arr.sorted { $0 < $1 }
        let isAsc = sortedArr == arr
        let isDec = sortedArr == arr.reversed()
        print("isasc: \(isAsc) isdec: \(isDec)")
    }
    
    func commaSeperated(_ arr: [String]) {
        print(arr.joined(separator: ","))
    }
    
    func cammelToSnake(_ str: String) {
        guard let regex = try? NSRegularExpression(pattern: "([a-z][A-Z])", options: []) else {
            return
        }
        let range = NSRange(location: 0, length: str.count)
        print(regex.stringByReplacingMatches(in: str, range: range, withTemplate: "$1_$2"))
    }
    
    func mostFrequent<Type: Hashable>(_ arr: [Type]) {
        var dict = [Type: Int]()
        for element in arr {
            if dict[element] == nil {
                dict[element] = 1
            } else {
                dict[element]! += 1
            }
        }
        print(dict.sorted(by: {$0.1 > $1.1 }).first?.key)
    }
    
    func filterFirstUniqueCharacter(_ str:String) {
        var dict = [Character: Int]()
        for char in str {
            dict[char] = (dict[char] ?? 0) + 1
        }
        print(str.filter({dict[$0] == 1}).first)
    }
    
    func flatArray<T>(_ arr: [[T?]]) {
        print(arr.flatMap{$0}.compactMap{$0})
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
        print("======")
        print(difference([1,1,3,4], arr2: [5,1,6,7]))
        print("======")
        print(checkForDuplicates([1,1,4,3]))
        print(checkForDuplicates([1,4,3]))
        print("======")
        
        view.addSubview(combineVC.view)
        combineVC.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        insertionSort(IntArray)
        print("======")
        randomChange(IntArray)
        print("======")
        calcMedian(IntArray)
        print("======")
        calAverage(IntArray)
        print("======")
        lcm2([1,1,3,4])
        print("======")
        maxn(IntArray)
        print("======")
        countVowels("im mom")
        print("======")
        firstWordLowerCase("Im dsldmsldmsd ds ds dsdsd sd s ds ds ds dddd")
        print("======")
        anagram("Bucketxhead", str2: "Death Cube K")
        print("=======")
        drop([1,1,1,1,2,2,3], num: 4)
        csv([["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"]])
        let reverseConcat = flip(concat)
        reverseConcat("2", "111")
        print("=======")
        dropRight([1,2,3,4]) { $0 < 3 }
        print("=======")
        evertNthElement([1,2,3,4,5], n: 2)
        print("=======")
        snake("cdDeeEe")
        print("=========")
        filterNonUnique([1,2,2,2,3,4,5])
        filterNonUnique(["Tim", "Steve", "Tim", "Jony", "Phil"])
        print("=======")
        isSortedArray([1,2,3,4,5])
        isSortedArray([5,4,3])
        isSortedArray2([1,2,3,4,5])
        isSortedArray2([5,4,3])
        print("=======")
        commaSeperated(["dddd", "eeee"])
        print("=======")
        cammelToSnake("dsdsdsddEeeee")
        print("=======")
        mostFrequent([1, 2, 5, 4, 1, 9, 8, 7, 4, 5, 1, 5, 1]) // 1
        mostFrequent(["a", "b", "c", "a"]) // "a"
        print("=======")
        filterFirstUniqueCharacter("EEUI")
        print("==========")
        flatArray([[1,nil,2], [2,4,nil]])
    }
}
