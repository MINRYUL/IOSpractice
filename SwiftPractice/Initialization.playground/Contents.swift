import UIKit

//클래스, 구조체, 열거형 인스턴스를 사용하기 위한 준비작업. Initializer를 정의하는 것으로 구현, swift의 initializer는 값을 반환하지 않음.
//Initializer로 저장 프로퍼티에 값을 설정하면 프로퍼티 옵저버가 호출되지 않고 값 할당이 수행 됨.
//프로퍼티 선언과 동시에 값을 할당하는 것으로 초기값을 줄 수 있음. 항상 같은 초기값을 갖는다면 프로퍼티 선언과 동시에 값을 할당하는 기본 프로퍼티(default property)를 이용하는 것이 좋음. 이 기본값은 상속시 함께 상속.
//모든 프로퍼티에 기본값이 설정돼 있다면 이니셜라이져를 생략해도 됨. swift가 알아서 한다.

//Initializer
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
//default property
struct Fahrenheit2 {
    var temperature = 32.0
}


//Initialization Parameter
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPoingOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0

//Parameter Name and Argument Label
//Initializer는 이름을 갖지 않고 Parameter로 식별
//초기화때 3개 입력받는 initializer와 하나만 입력받는 initializer
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
//초기화 과정에서 인자 레이블이 포함되어 있지 않다면 에러가 발생한다.

//Initializer 또한 외부 매개변수명(인자레이블)을 _를 이용해 생략 가능
struct Celsius2 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius2(37.0)
// bodyTemperature.temperatureInCelsius is 37.0

//옵셔널 프로퍼티
//프로퍼티의 값이 나중에 추가될 수 있는 경우 옵셔널로 선언해 둘 수 있다. 옵셔널 프로퍼티는 자동으로 nil 값으로 초기화 됨.
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// Prints "Do you like cheese?"
cheeseQuestion.response = "Yes, I do like cheese."

//상수 프로퍼티에 초기화 할당
//이니셜라이저는 상수 프로퍼티에 값을 할당하는 가능하다. 프로퍼티를 let으로 선언해서, 이 프로퍼티는 처음에 초기화되면 변경되지 않는 프로퍼티라고 표현할 수 있다.
//클래스 인스턴스에서 상수 프로퍼티의 초기화는 그 클래스 안에서만 가능하고, 서브 클래스에서는 변경이 불가능하다.
