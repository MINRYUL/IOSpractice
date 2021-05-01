# Frame VS Bounds

**Frame VS Bounds**

---

Frame : **Super View 좌표계**에서 View의 위치와 크기를 나타낸다.

(여기서 Super View는 현재 View에서 한칸 윗 계층 View를 일컫는 것이다.)

- Frame의 origin(x, y)
    - frame이 나타내는 origin(x, y) 좌표는 Super View의 원점을 (0, 0)으로 놓고 원점으로부터 얼마나 떨어져 있는지를 나타내는 것.
    - Super View의 원점이 곧 좌표의 시작점(0, 0)이 되는 것. 따라서 Super View의 좌표계에서 나타낸단 표현이 된다.
    - ***SuperView의 원점으로부터 얼마 만큼 떨어져 있는가.***
- Frame의 size(width, height)
    - ***View 영역을 모두 감싸는 사각형***으로 나타낸 것.
    - 따라서 frame의 size는 View 자체의 크기가 아닌, View가 차지하는 영역을 감싸서 만든 사각형이 바로 frame의 size이다.
    - 그렇기 때문에 frame의 size가 변경된다면 frame의 origin 값 또한 변경될 수 있다. → 이것이 frame의 속성.

Bounds : **자신의 좌표계**에서 **View의 위치와 크기**를 나타낸다.

- bounds의 origin(x, y)
    - bounds의 좌표계는 frame과 달리 Super View와는 아무 상관없으며 기준은 ***자기 자신.***
    - 자신의 원점을 (0, 0)으로 놓는다. → 좌표의 시작점을 자기의 원점으로 놓는다는 소리.
    - 때문에 View를 처음 생성하면 ***bounds의 origin은 무조건 (0, 0)으로 초기화 되어 있다.***
    - bounds를 바꿔줘야 하는 경우(ex → ScrollView의 ContentOffset)
- bounds의 size(width, height)
    - bounds의 size는 ***View 자체의 영역을 나타낸다.***
    - 따라서 Frame의 size와는 다르게 bounds의 size는 회전 시킨다고 크기가 바뀌지는 않는다.
    - 결과적으로 bounds의 origin은 변하지 않는다.
    - 왜냐하면 bounds는 시작점이 자신의 원점이기 때문에 View가 회전하든 안하든 ***자신의 원점이 곧 좌표의 시작점***이기 때문이다.

origin(x, y) 기준점

- frame: Super View의 좌표계
- bounds: 자신의 좌표계

size(width, height) 기준

- frame: View 영역을 모두 감싸는 사각형
- bounds: View 영역 자체

**Frame를 사용할 때**

- frame은 UIView의 위치, 크기를 나타낼 때 사용한다.
- 위치(origin)은 Super View 좌표계에서 나타내며, 크기(Size)는 View 영역을 모두 감싸는 사각형의 크기.
- 이러한 성질 때문에 ***frame은 UIView의 위치 및 크기를 설정할 때 사용한다.***
- ex) let myView: UIView = .init(frame: .init(x: 100, y: 100, width: 100, height: 100))

**Bounds를 사용할 때**

- Bounds 또한 UIView의 위치, 크기를 나타날 때 사용한다.
- 위치(origin)는 자신의 좌표계에서 나타내며, 크기(size)는 View 영역 자체의 size이다.
- 첫 번째로 ***View를 회전(transfomation) 한 후 View의 실제 크기를 알고 싶을 때 사용한다.***
- 두 번째로 ***View 내부에 그림을 그릴 때(drawRect) 사용한다.***
- 세 번째로 ***ScrollView에서 스크롤을 할 때 사용된다. (viewport가 바뀌는 것.)***
    - 스크롤하는 동작 자체라 ScrollView의 Bounds를 바꿔주는 것. → ScrollView의 SubView 중 어디를 보여줄지 정하는 것.
    - open var contentOffset: CGPoint → ScrollView의 Bounds를 설정하는 값.

사용 용도

frame: View의 위치와 크기를 나타낼 때.

bounds: View를 회전한 후 Vie의 실제 크기를 알고 싶을 때, View 내부에 그림을 그릴 때(drawRect), ScrollView에서 스크롤링 할 때