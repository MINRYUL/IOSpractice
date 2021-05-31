# MVVM Pattern

MVVM 패턴은 **Model / View / ViewModel**로 이루어져있는 패턴이다.

1. 사용자가 화면에서 Action을 취하면 Command Pattern으로 View → ViewModel로 전달된다.
2. ViewModel이 Model에게 data를 요청한다.
3. Model은 요청받은 data를 통해 update된 data를 ViewModel로 전달한다.
4. ViewModel은 응답받은 데이터를 가공해서 저장한다.
5. View는 ViewModel과의 Data Binding을 통해서 자동으로 갱신된다.

**Command Pattern?**

---

*Command = 명령어*

실행될 기능을 추상화, 캡슐화하여 한 클래스에서 여러 기능을 실행할 수 있도록 하는 패턴.

**Data Binding?**

---

 View와 로직이 분리되어 있어도 한 쪽이 바뀌면 다른 쪽도 업데이트가 이루어 지는 것.

- KVO
- Delegate
- Functional Reactive Programming
- Property Observer

**특징**

---

- MVVM 패턴은 Command 패턴과 Data Binding 두 가지 패턴을 사용하여 구현되었음. Command 패턴과 Data Binding을 이용하여 View와 View Model 사이의 의존성을 없앴다.
- View Model과 View는 1:n 관계이다.

**장점**

---

1. 유지보수에 좋다.
2. 자동화된 테스팅에 적합한 모델이다. (View Model과 View 간의 의존성이 없기 때문에 )
3. 새로운 개발자라도 빠르게 적응이 가능하고 개발이 가능한 수준의 난이도와 복잡성
4. 각각의 부분은 독립적이기 때문에 모듈화 하여 개발할 수 있다.

**단점**

---

1. 단순한 프로젝트를 개발하기에는 MVC에 비해서 시간이 오래걸림.
2. View Model의 설계가 쉽지 않다.