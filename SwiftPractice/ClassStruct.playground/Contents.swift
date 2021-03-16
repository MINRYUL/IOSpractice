import UIKit

//클래스와 구조체의 공통점
/*
 값을 저장하는 프로퍼티를 정의 가능.
 기능을 제공하는 메소드 정의 가능.
 subscript 문법을 이용해 특정값에 접근할 수 있는 subscript를 정의 가능.
 초기 상태를 설정하는 initializer를 정의 가능.
 익스텐션(Extension)을 통한 확장 기능.
 프로토콜(Protocol)의 conform.
 */

//클래스와 구조체릐 차이점
/*
 클래스는 참조 타입, 구조체는 값 타입.
 원본이 변경되었을때 원본을 참조하고 있던 클래스는 번부 변경, 값 타입인 구조체는 상관없음.
 애플은 기본적으로 구조체를 사용하되, 클래스에서만 가능한 일이 필요할때만 클래스를 이용하는 것을 권장.
*/

//클래스에서 가능한 일.
/*
 상속
 타입 캐스팅
 소멸자 메서드 이용(deinit)
 런타임에서 클래스는 인스턴스의 유형을 식별할 수 있지만 구조체는 그렇지 않음.
*/

//클래스와 구조체의 선언
struct Resolution {
    var width: Int = 0
    var height: Int = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced: Bool = false
    var frameRate: Float = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()
//클래스 구조체 선언 할때는 UpperCamelCase, 프로퍼티나 메소드는 lowerCamelCase 사용.

print("The width of someResolution is \(someResolution.width)")
// "The width of someResolution is 0" 이 출력
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is 0" 이 출력
someVideoMode.resolution.width = 1280 //resolution 전체의 값을 설정하지 않고 width 프로퍼티만 설정 가능.
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// "The width of someVideoMode is now 1280" 이 출력

//구조체의 초기화
let vga = Resolution(width: 640, height: 640)
//모든 구조체는 초기화시 프로퍼티를 선언할 수 있는 이니셜라이저(initializer)를 자동으로 생성해 제공.

//참조 판별을 위한 식별 연산자
//클래스는 참조타입이기 때문에 여러 상수와 변수에서 같은 인스턴스를 참조할 수 있다. 상수와 변수가 같은 인스턴스를 참조하고 있는지 비교하기 위해 식별 연산자 사용.
/*
 === : 두 상수나 변수가 같은 인스턴스를 참조하고 있는 경우 true
 !== : 두 상수나 변수가 다른 인스턴스를 참조하고 있는 경우 true
 */
//식별 연산자(===)는 참조를 비교하는 것이고, 비교 연산자(==)는 값을 비교한다는 차이가 있음.
