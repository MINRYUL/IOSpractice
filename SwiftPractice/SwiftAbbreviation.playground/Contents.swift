import UIKit

//MAP
//map(_:)은 클로저를 매개변수로 입력 받아 컨테이너 내부의 기존 데이터를 변형하여 새로운 컨테이너를 생성한다.

let numbers: [Int] = [1, 2, 3, 4, 5]

//numbers.map(transform: (Int) throws -> T)
//numbers 배열의 요소를 두 배로 만들어 Double 타입으로 반환
let doubledNumbers = numbers.map{ (item: Int ) -> Double in
    return Double(item * 2)
}
//map(_:) 메서드의 transform 매개변수의 클로저는 Int 타입의 요소를 매개변수로 받아 어떠한 타입 (제네릭 타입 T)로 반환한다. 따라서 매개변수와 반환 타입을 아래와 같이 생략 가능.
let doubledNumberss = numbers.map{ (item) in
    return Double(item * 2)
}
//그리고 이미 이 클로저에서 매 번 하나의 T 타입 반환 값이 있음을 알고 있으므로 return 키워드도 생략이 가능하다.
let doubleNumbersss = numbers.map { (item) in Double(item * 2) }
//클로저 안의 in 키워드는 매개변수와 반환값을 구분해주는 역할을 한다.

//Swift는 map(_:) 메서드의 클로저에 하나의 매개변수를 가지는 것을 이미 알고 있으므로 매개변수의 이름을 $0 으로 지칭할 수 있다. 미리 예약된 키워드인 $0 을 사용하면 매개변수의 이름을 짓기 위한 공간인 in 이전의 내용도 제거할 수 있음.
let doublednums = numbers.map{ Double($0 * 2) }

//FILTER
//filter(_:) 메서드는 isIncluded 이름을 매개변수로 받는 고차함수로, 컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출하는 기능을 수행한다.

//numbers.filter(isIncluded: (Int) throws -> Bool)
//filter(_:) 메서드를 이용하여 짝수인 수만 걸러내어 새로운 배열을 만듦.
let evenNumbers = numbers.filter{ (item: Int) -> Bool in
    return item % 2 == 0
}

let evenNumberss = numbers.filter{ (item) in
    return item % 2 == 0
}

let evenNumbersss = numbers.filter{ (item) in item % 2 == 0 }

let evenNums = numbers.filter{ $0 % 2 == 0 }

//REDUCE
//reduce(_:_:) 메서드는 컨테이너 내부의 요소들을 하나로 통합하는 기능을 수행한다. 컨테이너 내부의 요소에 클로저를 통해 전달 받은 작업을 하여 줄이는 역할을 수행.
//numbers.reduce(initialResult: Result, nextPartialResult: (Result, Int) throws -> Result)
//첫 번째 매개변수는 initialResult로 다음 매개변수인 nextPartialResult 에 입력된 클로저를 수행하기 전 최초값이다. 최초값으로부터 시작하여 nextPartialResult에 입력된 클로저의 동작을 컨테이너 내부의 요소를 하나씩 꺼내어 수행하는 형식으로 동작.

//초깃값 0으로 시작 컨테이너 내부의 요소들을 모두 더해나감.
let sumOfNumbers = numbers.reduce(0) { (partialResult: Int, currnetItem: Int) -> Int in
    return partialResult + currnetItem
}
//전달인자와 반환 타입 생략
let sumOfNumberss = numbers.reduce(0) { (partialResult, currnetItem) in
    return partialResult + currnetItem
}
//return 생략
let sumOfNumbersss = numbers.reduce(0) { (partialResult, currnetItem) in partialResult + currnetItem }
//전달인자 축약 표현
let sumOfNums = numbers.reduce(0) { $0 + $1 }
