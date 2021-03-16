import UIKit


//프로퍼티는 클래스, 구조체, 열거형과 관련된 값. 프로퍼티에는 저장 프로퍼티와 계산 프로퍼티가 있음.
//저장 프로퍼티는 클래스와 구조체에서만 사용 가능. 계산 프로퍼티는 클래스와 구조체, 열거형 모두에서 사용 가능.
//저장 프로퍼티는 옵저버를 이용해 값이 변할때마다 모니터링 가능.

//저장 프로퍼티(Stored Property)
//단순히 값을 저장하는 프로퍼티. let, var 이용

//public private(set) var
//get에 대해서는 public 하지만, set에 대해서는 private한 프로퍼티를 설정 가능.
class Human {
    public private(set) var name: String
    init(name: String) {
        self.name = name
    }
}

var john = Human(name: "John")

print(john.name)
/* error
 john.name = "paul"
 */
//john이라는 인스턴스 내부의 name은 외부에서 접근이 가능하되, 외부에서 변경이 불가능. 변경은 클래스 내부에서만 가능.

//구조체를 상수(let)로 선언할 때 저장 프로퍼티의 불변성
//let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//범위 값은 0, 1, 2, 3
/* error
 rangeOfFourItems.firstValue = 5
 */
//구조체 FixedLengthRangesms 상수(let)로 선언되었기 때문에 저장 프로퍼티를 변경할 수 없다.
//하지만 클래스는 let 으로 선언해도 프로퍼티 변경이 가능하다. 클래스는 참조 타입이기 때문.

//프로퍼티의 지연저장(Lazy stored property)
//프로퍼티의 값이 사용되기 전에 미리 계산되는걸 원치 않을 경우, 프로퍼티 선언 앞에 lazy 키워드를 붙이면 된다.
//지연 프로퍼티는 반드시 변수(var)로 선언되야 한다. 지연 프로퍼티는 처음 사용되기 전에는 값을 갖지 않는 프로퍼티이기 때문이다.
//지연 프로퍼티는 프로퍼티가 특정 요서에 의존적이어서 적절한 값을 바로 알지 못하는 경우에 유용. 또 복잡한 계산이 필요한 작업을 지연 프로퍼티로 선언하면 인스턴스 초기화 시점에서 복잡한 계산을 피할 수 있다.
class DataImporter {
    //이 클래스틑 초기화 하는데 매우 많은 시간이 소요된다 가정.(외부 파일에서 데이터를 가져오는 클래스)
    var filename = "data.txt"
    //데이터를 가져오는 기능이 구현되어 있다 가정.
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    //데이터를 관리하는 기능이 이 부분에 구현되어 있다 가정.
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
//DataImporter 인스턴스는 이 시점에 생성되어 있지 않음.

print(manager.importer.filename)
//the DataImporter 인스턴스가 생성되었음.
//"data.txt" 파일을 출력.
//DataImporter를 지연(lazy) 프로퍼티로 설정해 놓았기 때문에 실제 그 프로퍼티를 사용하기 이전에는 초기화 되지 않는다. -> 이것을 사용하기 이전에는 복잡한 과정을 거칠 필요가 없다는 뜻.
//manager.importer.filename가 실제로 실행될때 importer 비로서 인스턴스가 생성됨.

    
//계산 프로퍼티(Computed Property)
//계산 프로퍼티는 실제 값을 저장하는게 아니라, getter와 setter를 이용해 값을 탐색하고 다른 프로퍼티 값을 설정.
class TestGetAndSet {
    var testX : Int = 1
    var x: Int {
        get {
            return testX
        }
        set(newValue) { //setter 파라미터 생략 가능. 이 경우 set 내부에 newValue 키워드 사용해야 함.
            testX = newValue * 2
        }
    }
}
var test1: TestGetAndSet = TestGetAndSet()
test1.x = 10
print(test1.x) //20

class TestGetOnly {
    var testX : Int = 1
    var x: Int {
        get {
            return testX
        }
    }
}
var test2: TestGetOnly = TestGetOnly()
print(test2.x) //1
//클래스 내에 var x: Int 부분이 계산 프로퍼티. get과 set 둘다 사용할 경우, test1.x = 10 으로 프로퍼티에 접근 가능.
//아래쪽 TestGetOnly의 경우 test2.x = 10 을 치면 에러 발생. set이 없는 경우 get-only 프로퍼티이기에 값을 할당할 수 없음.
//연산 프로퍼티는 값이 고정돼 있지 않기 때문에 var로 선언해야 한다.
//set 에서 (newValue) 부분의 이름은 다른것으로 바꿔도 무관.

//복잡한 예제
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
// .center 라는 연산 프로퍼티 setter에 Point(x: 15.0, y: 15.0) 이 전달된다.
// set 은 origin.x 와 origin.y 에 각각 10.0이라는 값을 할당한다.
// get 에서 새로운 centerX와 centerY 가 연산된다. 그리고 연산된 값을 기반으로 한 새로운 좌표값 구조체 Point(x: centerX, y: centerY)를 반환한다.
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// "square.origin is now at (10.0, 10.0)" 출력

//프로퍼티 옵저버
//프로퍼티에서 새 값이 설정(set)될 때마다 이벤트르 감지할 수 있는 기능. 새 값이 이전 값과 같은 값이라도 프로퍼티 옵저버는 항상 호출.
//프로퍼티 옵저버는 지연 저장 프로퍼티에서는 사용될 수 없다.
//계산 프로퍼티는 setter에서 값의 변화를 감지 할 수 있기 때문에 프로퍼티 옵저버를 정의할 필요가 없다.
//프로퍼티에서는 두가지 옵저버를 제공.
/*
 willSet: 값이 저장되기 바로 직전에 호출 됨.
 didSet: 새 값이 저장되고 난 직후에 호출 됨.
 willSet에서는 새 값의 파라미터명을 지정 가능. 지정하지 않으면 기본 값으로 newValue를 사용
 didSet에서는 바뀌기 전의 값의 파라미터명을 지정 가능. 지정하지 않으면 기본 값으로 oldValue를 사용.
 */

//예제
class StepCounter {
    var totalSteps: Int = 0{
        willSet(newTotalSteps) {
            print("About to set totalSteps : \(totalSteps) to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps : 0 to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps

//totalSteps 라는 변수가 바뀌기 직전 willSet에 해당하는 코드가 실행되고, 변수가 바뀐 뒤에는 didSet에 해당하는 코드가 실행.
//willSet은 newValue의 파라미터명을 newTotalSteps로 정의, didSet은 기본 값인 oldValue를 사용.

//타입 프로퍼티
//어떤 클래스 내의 프로퍼티를 사용하고 싶은데, 클래스 전체를 메모리에 할당해서 사용할 필요는 없을때 사용하는 방법.
//타입 프로퍼티는 특정 타입에 속한 프로퍼티로, 그 타입에 해당하는 단 하나의 프로퍼티만 생성된다.
//인스턴스 프로퍼티와 다르게 타입 프로퍼티는 항상 초기값을 지정해야 한다. 타입프로퍼티에는 이니셜라이저가 없어서 초기화 되지 않기 때문.
//타입 프로퍼티는 static, class 키워드를 사용한다. static으로 선언된 타입 프로퍼티는 오버라이딩이 불가능, class로 선언된 타입 프로퍼티는 오버라이딩이 가능.

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
print(SomeClass.computedTypeProperty) //Prints "27"

//변수에 클래스를 할당해 인스턴스를 형성하지 않고도, SomeClass.computedTypeProperty 를 통해 프로퍼티를 사용할 수 있다.
//타입 프로퍼티 뿐만 아니라 타입 메소드도 존재한다. 타입 프로퍼티처럼 쓸 수 있다.
