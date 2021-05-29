# MVC Pattern

**MVC** 패턴은 애플에서 기본적으로 제공하는 디자인 패턴, **Model + View + Controller** 구조의 아키텍처 패턴을 말한다.

**Model**은 앱의 데이터와 비즈니스 로직을 가지고 있음.

**View**는 사용자에게 데이터를 보여주거나 UI를 담당한다.

**Controller**는 **Model**과 **View**의 중간다리 역할로 **View**로부터 사용자의 **action**을 받아 **Model**에게 어떤 작업을 해야 하는지 알려주거나, **Model**의 데이터 변화를 **View**에게 전달하여 **View**를 어떻게 업데이트할지 알려준다.

**Controller**는 **Model**과 **View**에 직접 지시를 할 수 있지만 **Model**과 **View**는 **Controller**에 직접적으로 알릴 수 없다.

**View to Controller**

---

- Controller는 View에서 발생할 수 있는 action에 대한 **target**을 만들어준다. 그래서 View에서 유저의 action이 발생할 경우 Controller에 있는 **target**이 이를 받아들이고 작업을 수행한다.
- View는 **delegate** 패턴의 delegate와 datasource를 이용해여 Controller에게 어떤 작업을 수행해야 하는지 알리기도 한다.
- 대표적인 예로 UITabelView의 UITabelViewDelegate와 UITableViewDatasource를 들 수 있다.

**Model to Controller**

---

- Model은 Observer 패턴의 **Norification** 과 **KVO**(key Value Observation)을 통해 Controller에게 알린다.
- Notification과 KVO는 일을 수행하는 객체(publisher)가 진행하던 작업이 끝나면 자신들을 구독 중인 객체들(subscribers)에게 신호를 보내는 방식이다.
- 즉, 작업이 완료됐을 때 라디오 센터에서 전파를 보내는 것처럼 Controller에게 신호를 보낸다.

**MVC 패턴의 장점 및 단점**

---

- 장점
    - 다른 패턴에 비해 코드량이 적다.
    - 애플에서 기본적으로 지원하고 있는 패턴이기 때문에 쉽게 접근할 수 있다.
    - 많은 개발자들에게 친숙한 패턴이기 때문에 개발자들이 쉽게 유지보수가 가능하다.
    - 개발 속도가 빠르기 때문에 아키텍처가 중요하지 않을 때 사용하거나 규모가 작은 프로젝트에서 사용하기 좋다.
- 단점
    - View와 Controller가 너무 밀접하게 연관되어 있다.
    - ViewController에서 볼 수 있듯이, View와 Controller가 붙어 있으며, Controller가 View의 Life Cycle까지 관리하기 때문에 View 와 Controller를 분리하기 어렵다. 때문에 재사용성이 떨어지고, 유닛 테스트를 진해하기 힘들어진다. 또한 대부분의 코드가 Controller에 밀집될 수 있다.
    - Life Cycle 관리 뿐만 아니라, delegate나 datasource 관리, 네트워크 요청, DB에 데이터 요청 등 많은 코드가 Controller에 작성되면 Controller의 크기는 비대해지고 내부 구조는 복잡해지게 된다.→ Massive View Controller
    - 복잡해진 코드는 프로젝트 규모가 커질수록 유지보수하기 힘들게 만든다.