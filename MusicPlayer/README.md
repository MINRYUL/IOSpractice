# MusicPlayer

imageView, label, slider등을 사용해 iOS musicplayer를 제작해보는 실습

---

**IBOutlet**

---

- 스토리보드의 컴포넌트와 연결을 담당하는 어노테이션.
- 골뱅이는 컴파일러에게 어떠한 속성을 가지고 있다고 전달해주는 예약어라고 볼 수 있음.
- 컴포넌트와 연결되어 있을 때 IBOutlet 변수의 이름을 바꾸면 연결된 컴포넌트를 찾을 수 없음. (실행시 런타임 오류 발생)
- 이름을 바꿀때는 Refator → Rename 으로 바꾸면 런타임 오류가 나지 않는다.

**IBAction**

---

- 연결한 컴포넌트에 지정한 이벤트가 발생되었을때 컴포넌트와 연결된 함수가 실행된다.

**컨트롤 이벤트**

---

- touchDown: 컨트롤을 터치햇을 때 발생하는 이벤트 (UIControl.Event.touchDown)
- touchDownRepeat: 컨트롤을 연속 터치 할 때 발생하는 이벤트 (UIControl.Event.touchDownRepeat)
- touchDragInside: 컨트롤 범위 내에서 터치한 영역을 드래그 할 때 발생하는 이벤트 (UIControl.Event.touchDragInside)
- touchDragOutside: 터치 영역이 컨트롤의 바깥쪽에서 드래그 할 때 발생하는 이벤트 (UIControl.Event.touchDragOutside)
- touchDragEnter: 터치 영역이 컨트롤의 일정 영역 바깥쪽으로 나갔다가 다시 들어왔을 때 발생하는 이벤트 (UIControl.Event.touchDragEnter)
- touchDragExit: 터치 영역이 컨트롤의 일정 영역 바깥쪽으로 나갔을 때 발생하는 이벤트 (UIControl.Event.touchDragExit)
- touchUpInside: 컨트롤 영역 안쪽에서 터치 후 뗐을때 발생하는 이벤트 (UIControl.Event.touchUpInside)
- touchUpOutside: 컨트롤 영역 안쪽에서 터치 후 컨트롤 밖에서 뗐을때 이벤트 (UIControl.Event.touchUpOutSide)
- touchCancel: 터치를 취소하는 이벤트 (touchUp 이벤트 발생 안함) (UIControl.Event.touchCancel)
- valueChanged: 터치를 드래그 및 다른 방법으로 조작하여 값이 변경되어을때 발생하는 이벤트 (UIControl.Event.valueCanged)
- primaryActionTriggered: 버튼이 눌릴때 발생하는 이벤트 (UIControl.Event.primaryActionTriggered)
- editingDidBegin: UITextField에서 편집이 시작될 때 호출되는 이벤트 (UIControl.Event.editingDidBegin)
- editingChanged: UITextField에서 값이 바뀔 때마다 호출되는 이벤트 (UIControl.Event.editingChanged)
- editingDidEnd: UITextField에서 외부객체와의 상호작용으로 인해 편집이 종료되었을 때 발생하는 이벤트 (UIControl.Event.editingDidEnd)
- editingDidEndOnExit: UITextField의 편집상태에서 키보드의 return 키를 터치했을 때 발생하는 이벤트 (UIControl.Event.editingDidEndOnExit)
- allTouchEvents: 모든 터치 이벤트 (UIControl.Event.allTouchEvents)
- allEditingEvents: UITextField에서 편집작업의 이벤트 (UIControl.Event.allEditingEvents)
- applicationReserved: 각각의 애플리케이션에서 프로그래머가 임의로 지정할 수 있는 이벤트 값의 범위 (UIControl.Event.applicationReserved)

**delegate**

---

- 어떤 이벤트가 발생했을때 피드백을 받을 수 있는 기능.

**MARK**

---

- // MARK: - 하위 목록 생성
- - 가 없고 // MARK: 만 있으면 목록으로 생성된다.
- 해당 주석이 있으면 툴바로 점프가 가능하다.

**문법**

---

- 변수뒤에 ! ?를 붙이는 것을 Optional이라고 한다.
- ?가 붙을시 해당 변수에 nil 값이 들어가는 것을 허용한다는 뜻이다.
- !가 붙을시 해당 변수는 빈 값일리 없다는 뜻이다.

**단축키**

---

- command + shift + o : Open Quickly
- command + r : 어플리케이션 실행
- 컴포넌트를 control로 끌어서 메소드와 Action을 연결할 수 있음.