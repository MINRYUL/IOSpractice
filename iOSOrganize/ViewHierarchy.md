# iOS의 View 체계

**뷰의 기본적인 역할**

---

- iOS에서 화면에 애플리케이션의 콘텐츠를 나타내기 위해 윈도우와 뷰를 사용. 윈도우는 그 자체로 콘텐츠를 표현할 수 없지만 애플리케이션의 뷰를 위한 컨테이너 역할을 한다. 뷰는 UIView 클래스 또는 UIView 클래스의 하위 클래스(Subclass)의 인스턴스로 윈도우의 한 영역에서 콘텐츠를 보여준다. 뷰가 나타낼 수 있는 콘텐츠는 이미지, 문자, 도형 등과 같이 다양하다. 뷰는 또 다른 뷰를 관리하고 구성하기 위해 사용되기도 한다.
- 뷰는 제츠서 인식기(gesture recognizer)를 사용하거나 직접 터치 이벤트를 처리할 수 있다. 또한 뷰 계층(view hierarchy) 구조에서 부모뷰(parent view)는 자식뷰(child view)의 위치와 크기를 관리.
- 나타내고자 하는 유형의 콘텐츠에 적합한 뷰를 여러 개 사용하여 뷰 계층(view hierarchy)구조를 구성하고 이를 통해 콘텐츠를 보여주는 것이 좋다. UIKit에는 이미지, 텍스트 그리고 다른 유형의 콘텐츠를 나타내는 뷰가 포함되어 있다.

**뷰 계층(View hierarchy)**

---

- 뷰 계층구조와 서브뷰 관리
    - 뷰는 자신의 콘텐츠를 보여주는 것과 더불어, 다른 뷰를 위한 컨테이너로써의 역할도 한다. 하나의 뷰가 다른 뷰를 포함할 때, 두 뷰 사이에 부모- 자식 관계가 생성된다. 해당 관계에서는 자식뷰는 서브뷰(subView)로, 부모뷰는 슈퍼뷰(superView)로 불려집니다. 부모-자식 관계 형성은 애플리케이션의 시각적 모습과 동작 모두에 영향을 미친다.
    - 슈퍼뷰와 서브뷰 관계에서 서브뷰가 불투명할 경우 슈퍼뷰가 서브뷰에 가려진다.
    - 서브뷰가 반투명할 경우 서브뷰와 슈퍼뷰의 콘텐츠가 서로 섞여 화면에 보여진다.
    - 슈퍼뷰는 하나의 배열 안에 서브뷰를 순서대로 저장한다. 만약 하나의 슈퍼뷰에 포함된 두 서브뷰가 서로 겹체 되면, 나중에 추가된(또는 서브뷰 배열의 끝으로 옮겨진) 서브뷰가 맨 위에 보여지게 된다.
    - 두 서브뷰가 모두 반투명할 경우 뒤에 있는 모든 뷰들이 섞여 화면에 보여지가 된다.

**뷰 계층의 생성과 관리**

---

- 인터페이스 빌더를 이용하는 방법과 코드를 작성하는 방법이 있음.