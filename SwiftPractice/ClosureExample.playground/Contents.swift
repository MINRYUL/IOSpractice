import UIKit

//Closure는 함수나 Clousre 표현식과 같은 독립적인 코드 불록이, 코드 블록 주변에 있는 변수들과 결합된 것을 말함.
//Closure는 함수가 선언될 당시의 환경을 기억했다가 나중에 호출되었을때 원래의 환경에 따라 수행되는 함수.
func functionA() -> () -> Int {
    var counter = 0
    
    func functionB() -> Int {
        return counter + 10
    }
    return functionB
}
//functionA는 ()를 받아서 "()를 받아 Int를 반환하는 함수.
//functionB 내부에서 counter라는 변수가 쓰였는데, counter 변수는 functionB 라는 독립적인 코드 불록 밖에서 선언된 변수.
//functionB는 내부 영역밖에 선언된 counter에 의존하는 클로저이고, functionA는 클로저를 반환하고 있음.

//incrementer 라는 함수를 반환하는 함수 makeIncrementer.
func makeIncrementer(forIncrement amout: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amout
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

incrementByTen()    //10
incrementByTen()    //20

let incrementBySeven = makeIncrementer(forIncrement: 7)

incrementBySeven()  //7
incrementBySeven()  //14

var itIsIncrementByTenToo = incrementByTen
itIsIncrementByTenToo() //30
//Closure는 레퍼런스 타입.

