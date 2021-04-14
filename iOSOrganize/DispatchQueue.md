# DispatchQueue

DispatchQueue는 작업항목의 실행을 관리하는 클래스이다. 대기열(Queue)에 추가된 작업항목은 시스템이 관리하는 스레드 풀에서 처리하고 작업을 완료하면 스레드를 알아서 해제한다. DispatchQueue의 장점은 일반 스레드 코드보다 쉽고 효율적으로 코드를 작성할 수 있다는 점이다. 주로 iOS에서는 서버에서 데이터를 내려받는다든지 이미지, 동영상 등 멀티미디어 처리와 같이 CPU 사용량이 많은 처리를 별도의 스레드에서 처리한 뒤 메인 스레드로 결과를 전달하여 화면에 표시한다. 그리고 DispatchQueue를 생성 시 기본은 Serial이다. Concurrent 유형으로 바꾸려면 별도로 명시만 해주면 된다.

**대기열(Queue) 유형**

---

Serial

- 대기열(Queue)에 등록한 순서대로 작업을 실행한다. 하나의 작업을 실행하고 실행이 끝날 때까지 대기열(Queue)에 있는 다른 작업을 미루고 있다가 이전 작업이 끝나면 실행한다.

Concurrent

- 실행 중인 작업이 끝나기를 기다리지 않고 대기열(Queue)에 있는 작업을 동시에 별도의 스레드를 사용하여 실행한다. 즉, 병렬처리 방식이다.

**주요 프로퍼티**

- main : 애플리케이션의 메인 스레드와 연결된 `Serial DispatchQueue`를 반환.

    ```
     class var main: DispatchQueue { get }
    ```

- label : 대기열(Queue)을 식별하기 위한 문자열 레이블.

    ```
     var label: String { get }
    ```

- qos : `DispatchQoS`구조체의 타입의 프로퍼티. 대기열 작업을 효율적으로 수행할 수 있도록 여러 우선순위 옵션을 제공합니다.

    ```
     var qos: DispatchQoS { get }
    ```

**주요 메서드**

- sync(execute:) : `DispatchQueue`에서 실행을 위해 클로저를 대기열(Queue)에 추가하고 해당 클로저가 완료될 때까지 대기합니다.

    ```
    func sync(execute block: () -> Void)
    ```

- async(execute:) : `DispatchQueue`에서 비동기 실행을 위해 클로저를 추가하고 즉시 실행합니다.

    ```
     func async(execute workItem: DispatchWorkItem)
    ```

- asyncAfter(deadline:execute:) : 지정된 시간에 실행하기 위해 클로저를 `DispatchQueue`에 추가합니다. 그리고 지정된 시간이 지나면 바로 실행합니다.

    ```
     func asyncAfter(deadline: DispatchTime, execute: DispatchWorkItem)
    ```

- global(qos:) : 시스템의 글로벌 대기열(Queue)을 반환

    ```
    class func global(qos: DispatchQoS.QoSClass = default) -> DispatchQueue
    ```