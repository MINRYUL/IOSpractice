import UIKit

//인스턴스 메소드는 특정 클래스나 구조체, 열거형의 인스턴스에 속한 메소드를 일컫음.

//mutating 키워드를 이용하면 구조체와 열거형에서 값 타입을 변경할 수 있다.
struct MoveForward{
    var one: Int = 1, two: Int = 2, three: Int = 3
    mutating func moveForward(_ one: Int, _ two: Int, _ three: Int){
        self.one = one + 1
        self.two = two + 1
        self.three = three + 1  //인스턴스 프로퍼티들은 self 키워드를 붙야 에러를 띄우지 않음.
    }
}
var mutatingTest = MoveForward()
mutatingTest.moveForward(1, 2, 3)
print(mutatingTest.one, mutatingTest.two, mutatingTest.three)
//구조체와 열거형은 값 타입이라, 기본적으로 인스턴스 메소드 내에서 값 타입의 프로퍼티를 변경할 수 없지만 메소스 선언때 mutating 키워드를 사용하면 변경 가능.
//구조체를 할당할때 var가 아니라 let으로 선언했다면, mutating 키워드를 써도 값을 변경할 수 없다.

//mutating 메소드에서 self 프로퍼티를 이용해면 새로운 인스턴스를 만들 수 있다.
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        x += deltaX
        y += deltaY
    }
}

struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point2(x: x + deltaX, y: y + deltaY)
    }
}
//이 두개의 구조체는 같은 동작을 한다.

//타입 메소드는 인스턴스를 할당하지 않고도 호출할 수 있는 메소드이다. 메소스 선언때 static이나 class를 붙여주면 된다.
//class를 붙여 선언한 타입 메소드는 서브클래스에서 오버라이드 가능. static은 오버라이드 불가능.
class SomeClass {
    class func someTypeMethod() {
        //타입 메소드 구현
    }
}
SomeClass.someTypeMethod() //타입 메소드 호출.
//타입 메소드 안에서도 self 키워드를 사용할 수 있지만, 이 경우 타입 메소드의 self는 인스턴스가 아니라 타입 메스도 자기 자신을 의미.a
