import UIKit

//클로저의 종류
//이름을 갖고 있고, 어떤 값도 캠쳐하지 않는 Global Function(전역 함수).
//이름을 갖고 있고, 자신을 감싸고 있는 함수에서 값을 캡쳐해 가질 수 있는 Nested Function.
//이름이 없고, 자신을 둘러싼 환경의 값을 캡쳐해 가질 수 있는 Closure Expression.


//Closure expression
let sayHello = { print("Hello!") }

let multiply = {(_ input1: Int, _ input2: Int) -> Int in
    return input1 * input2
}
//함수와 큰 차이가 없음. 함수와 클로져 표현식의 차이점은, 함수는 이름이 있고 클로저 표현식은 이름이 없다.
//함수는 이름이 있는 클로저 표현식일 뿐.

//클로저 특징
/*
 파라미터와 리턴값 타입 추론
 한줄짜리 표현에서 return 문구 생략 가능
 Argument 이름에 대해 축약어 사용가능
 Trailing Closures: 한수의 마지막 인자가 클로저 표현식인 경우, 소괄호 () 뒤에 중괄호 {}로 빼내서 쓸 수 있음.
*/

//파라미터와 리턴값 추론.
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
var reversedNames = names.sorted(by: { (s1, s2) in
    return s1 > s2
})
//쿨로저 표현식의 경우, 인풋 파라미터와 아웃풋 리턴에 대해 타입을 명시하지 않아도 스위프트 컴파일러가 어느정도 알아서 추론해줌.
//한줄짜리 표현에서 return 문구 생략
var reversedNames2 = names.sorted(by: { (s1, s2) in
    s1 > s2
})
//Trailing Closures: 함수의 마지막 인자가 클로저 표현식인 경우, 소괄호 () 뒤에 중괄호 {} 로 빼내서 쓸 수 있다.
var reversedNames3 = names.sorted(){ $0 > $1 }
//sorted라는 함수의 마지막 인자로 클로저 표현식이 들어갔는데, 이 경우 소괄호 바깥으로 뺴서 적을 수 있음 소괄호 생략 가능.
var reversedNames4 = names.sorted{ $0 > $1 }

//SwiftUI 에서 사용되는 HStack, VStack 등이 Trailing Closure 방식으로 많이 쓰인다.
/* 클로저 표현식은 비동기 메서드 호출에 대한 완료 핸들러를 선언할 때 종종 사용됨. IOS 어플리케이션을 개발할 때 어떤 작업을 백그라운드에서 작업하게 해서 어플리케이션이 다른 작업을 계속 할 수 있도록 해야 하는 경우가 종종 생긴다. 이런 경우에는 보통 시스템이 어플리케이션에게 작업이 완료된 것을 알리고 메서드를 호출할 때 선언했던 완료 핸들러를 호출하여 결과를 반환.
 완료 핸들러에 대한 코드는 주로 클로저 표현식을 이용해 작성*/

/*
 eventstore.reqyestAccess(to: .reminder, completion: {(granted: Bool, error: Error?) -> Void in
     if !granted {
         print(error!.localizedDescription)
     }
 })
 */
