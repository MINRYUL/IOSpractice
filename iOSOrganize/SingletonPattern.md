# Singleton Pattern

Singleton이란 클래스를 static으로 최초 한번만 메모리에 할당하고, 그 메모리에 객체를 만들어 사용하는 디자인 패턴, 생성자를 이용해여 반복적으로 호출해도 최초에 할당했던 메모리에 있는 객체를 반환한다.

**왜 Singleton을 사용할까?**

---

 고정된 메모리를 사용하고, 하나의 인스턴스를 사용하기 때문에 메모리 낭비를 방지할 수 있다. 또한 싱글톤으로 만들어진 인스턴스는 전역 인스턴스이기 때문에 다른 클래스의 인스턴스들이 데이터를 공유하기 쉽다. 다른 객체들이 공통된 객체에 접근해야 하는 경우 유용하다. 인스턴스가 절대적으로 하나만 존재하는 것을 보증하고 싶은 경우 사용하기도 한다. 

**Singleton의 문제점**

---

 싱글톤 인스턴스가 많은 일을 하거나 많은 데이터를 공유한다면 다른 클래스들의 인스턴스와의 결합도가 높아진다. 이는 객체 지향 설계 원책인 개방-폐쇄 원칙을 위배하고, 테스트하고 수정하기 어렵게 만든다. 또한 멀티 쓰레드 환경에서 동기화 처리 문제(인스턴스가 두 개 생성되는 경우) 등이 발생할 수 있다. 따라서 싱글톤은 꼭 필요한 경우에만 사용하는 것이 좋다.

**일반적인 초기화**

---

 우선 다른 클래스에서 접근하지 못하도록 인스턴스를 `private` 으로 만든다. 이 때, 전역 변수인 `static`을 선언하여 프로그램이 로드될 때 최초 한 번만 메모리를 할당하도록 한다. 생성자도 다른 클래스에서 새로운 생성자를 통해 인스턴스를 만들지 못하도록 `private`으로 만든다. 다른 클래스에서 인스턴스를 호출할 수 있도록 `getInstance()` 메서드를 만든다. 생성자를 만들지 않고 바로 메서드를 호출하기 위해서 `static` 으로 선언한다.

**Static block initialization**

---

 Static block을 이용하면 클래스가 로딩 될 때 최초 한번 실행하게 된다. 초기화 블럭을 이용하면 초기 변수 세팅, 에러 처리 등과 같은 로직을 담을 수 있다. 일반적인 초기화와 마찬가지로 인스턴스가 생성되는 시점에 메모리에 올라가는 것이 아닌, 프로그램이 최초로 로드 될 때 메모리에 올라간다는 문제점이 있다.

**Lazy initialization**

---

 게으른 초기화는 앞선 두 방법과 달리 인스턴스를 호출하는 시점에 메모리에 할당하는 방법이다. 위 코드와 같이 `getInstance()`를 통한 인스턴스 호출이 발생했을 경우 생성자를 통하여 인스턴스를 만들고 반환한다. 일반적인 방법보다 메모리를 효율적으로 관리할 수 있다. 하지만 만약 멀티 쓰레드 환경에서 개발을 하게 된다면 문제가 발생할 수 있다.

**Thread-safe Lazy initialization**

---

 Lazy initialization에 `synchronized` 키워드를 추가하여 멀티 쓰레드 환경에서도 안전하게 작동하도록 하는 방법이다. 하지만 `synchronized` 키워드를 사용하면 성능저하가 발생할 수 있다.

**Initialization on demand holder idiom**

---

 클래스 안에 또 다른 클래스(holder)를 두어JVM의 클래스 로더 매커니즘과 클래스의 로드 시점을 이용한 방법이다. JVM의 클래스 초기화 과정에서 보장되는 원자적 특성을 이용하여 싱글톤의 초기화 문제에 대한 책임을 JVM에 넘긴다. 현재 싱글톤을 이용한다고 하면 이 방법을 제일 많이 이용된다.

pulic class LazyHolderInitialization { 

private LazyHolderInitialization () {}

private static class LazyHolder {

public static final LazyHolderInitialization instance = new LazyHolderInitialization ();

}

public static LazyHolderInitialization getInstance() {

return LazyHolder.instance;

}

}