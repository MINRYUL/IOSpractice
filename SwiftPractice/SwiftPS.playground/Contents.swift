import UIKit

//키보드 입력 받기
let inputValue = readLine()
print(inputValue)

//split()로 쪼개기
//let nums = readLine()!.split(separator: " ")
//print(nums)

//빈 배열 생성
var emptyArr: [Int] = []
var emptyArr2 = [Int]()
var emptyArr3: Array<Int> = []

//생성과 동시에 초기화
var array = Array(1...5)
print(array)

//길이 지정 배열 생성
var arr = Array(repeating: 0, count: 5)
print(arr)

//2차원 배열 생성
let matrix = [[Int]]()

let arr2: [[Int]] = Array(repeating: Array(repeating: 0, count: 5), count: 3)

print(arr2)

//배열 뒤집기
var arr3 = Array(1...5)
arr3.reversed()

//배열 정렬하기
var arr4 = Array(1...5)
var arr5 = Array(1..<5)

print(arr4.sorted());
print(arr4.sorted(by: >))

//핵심 map, filter, reduce
//map
var arr6 = ["1", "2", "3", "4"]
print(arr6.map {Int ($0)!})
//->map은 이름 그대로 맵핑을 진행한다,
//클로저로 각 항목들을 반영한 결과물을 가진 새로운 배열을 생성한다.
//위와 같이 사용하면 String 객체를 Int 객체로 모두 변환할 수 있다.

//filter
var arr7 = Array(1...5)
arr.filter{ $0 % 2 == 0 }
//filter는 클로저로 각 항목들을 비교하여 원소들 중 특정 조건에 맞는 원소만 뽑어내는 필터링을 진행한다.

//reduce
var arr8 = [1, 2, 3, 4]
print(arr.reduce(0, +))
//reduce는 배열의 각 항목들을 재귀적으로 클로저를 적용시켜 누적값으로 하나의 값을 만든다.

//Character 얻는 방법
let strr = readLine()
//let arrr = Array(strr)
print(strr)

//제곱근
let num: Double = 16
sqrt(num)
//sqrt는 Double이나 Float만 받을 수 있다.

//진법 변환
// -> n진법으로 나타내어져 있는 String을 10진법으로 바꾸고 싶음
let binary = "111"
let decimal = Int(binary, radix: 2)!
print(decimal)

let hex = "bb0"
let decimall = Int(hex, radix: 16)!
print(decimall)
//진법 변환시 text부분에는 string protocol을 따르는 것만이 들어가야 한다.

//10진수를 받고 n진법 변환
//String int value에는 binaryInteger 프로토콜을 준수하는 것만 들어가야 한다.
let integer = 7
let binaryy = String(integer, radix: 2)
print(binaryy)

//uppercase는 Optional
let integerr = 2992
let hexx = String(integerr, radix: 16, uppercase: true)
print(hexx)

//소수점 몇번째 자리까지 표시하고 싶다.
let doubleNum: Double = 10 / 3
let duration = String(format: "%.04f", doubleNum)
print(duration)
