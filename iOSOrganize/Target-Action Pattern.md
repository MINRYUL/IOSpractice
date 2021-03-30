# Target-Action Pattern

- Target-Action 디자인 패턴은 iOS 환경에서 많이 사용하는 디자인 패턴 중 하나입니다. Target-Action 디자인 패턴에서 객체는 이벤트가 발생할 때 다른 객체에 메시지를 보내는 데 필요한 정보를 포함. 액션은 특정 이벤트가 발생했을 때 호출할 메서드를 의미. 그리고 타겟은 액션이 호출될 객체를 의미. 이벤트 발생 시 전송된 메시지를 액션 메시지라고 하고, 타겟은 프레임워크 객체를 포함한 모든 객체가 될 수 있으나, 보통 컨트롤러가 되는 경우가 일반적.

**액션 메서드**

---

- 액션 메서드는 특정한 양식이 필요. IBAction은 인터페이스 빌더가 메서드를 인지할 수 있도록 해줍니다. 스위프트 언어를 활용한 프로그래밍 방식에서 @objc는 Swift 클래스를 사용하는 Objective-C 코드가 있거나 Objective-C유형의 메서드를 사용하는 경우 필요

```
// 프로그래밍 방식
@objc func doSomething(_ sender: Any) {

}

// 인터페이스 빌더
@IBAction func doSomething(_ sender: Any) {

}
```

- 애플의 프레임워크는 Objective-C 언어로 작성된 코드가 많기 때문에 스위프트 언어로 작성한 코드에서는 Objective-C 코드와 호환하기 위해서 @objc라고 표시해주어야 한다.

**컨트롤 이벤트**

---

- 컨트롤 이벤트와 액션과의 관계
    - UIKit에는 `UIButton`, `UISwitch`, `UIStepper` 등 `UIControl`을 상속받은 다양한 컨트롤 클래스가 있다. 그런 컨트롤 객체에 발생한 다양한 이벤트 종류를 특정 액션 메서드에 연결할 수 있다. 즉, 컨트롤 객체에서 특정 이벤트가 발생하면, 미리 지정해 둔 타겟의 액션을 호출하게 됨.

- 컨트롤 이벤트의 종류
    - 컨트롤 이벤트는 `UIControlEvents`라는 타입으로 정의되어 있습니다.