# Segue

세그는 스토리보드에서 뷰 컨트롤러 사이의 화면전환을 위해 사용하는 객체. 별도의 코드 없이도 스토리보드에서 세그를 연결하여 뷰 컨트롤러 사이의 화면전환을 구현할 수 있다.

**UIStoryboardSegue 클래스**

---

 UIStoryboardSegue 클래스는 UIKit에서 사용할 수 있는 표준 화면전환을 위한 프로퍼티와 메서드를 포함하고 있다. 또 커스텀 전환을 정의하기 위해 서브클래스를 구현해서 사용할 수도 있다. 필요에 따라서 UIViewController의 performSegue(withIdentifier:sender:)메서드를 사용하여 세그 객체를 코드로 실행할 수 있다.

 세그(Segue) 객체는 뷰 컨트롤러의 뷰 전환과 관련된 정보를 가지고 있다. 세그는 뷰 컨트롤러의 뷰를 다른 뷰 컨트롤러의 뷰로 전환할 때 뷰 컨트롤러의 prepare(for:sender:) 메서드를 사용하여 새로 보여지는 뷰 컨트롤러에 데이터를 전달할 수 있다.

*주요 프로퍼티*

- var source: UIViewController : 세그에 전환을 요청하는 뷰 컨트롤러
- var destination: UIViewController : 전환될 뷰 컨트롤러
- var identifier: String? : 세그 객체의 식별자

*주요 메서드*

- func perform() : 뷰 컨트롤러의 전환을 수행.