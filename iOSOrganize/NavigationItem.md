# Navigation Item

내비게이션 아이템은 내비게이션바의 콘텐츠를 표시하는 객체. 그리고 뷰 컨트롤러가 전환될 때마다 내비게이션바는 하나의 공동 객체지만, 내비게이션 아이템은 각각의 뷰 컨트롤러가 가지고 있는 프로퍼티. 즉, 내비게이션바가 내비게이션 컨트롤러와 연관이 있다면 내비게이션 아이템은 해당 뷰 컨트롤러와 연관이 있다. 보통 내비게이션바에서 보여지는 중앙 타이틀, 좌측 바 버튼, 우측 바 버튼 등이 내비게이션 아이템의 프로퍼티.

**주요 프로퍼티**

- title : 내비게이션바에 표시되는 내비게이션 아이템의 제목. 기본값은 `nil` 이다.

    ```
     var title: String? { get set }
    ```

- backBarButtonItem : 내비게이션바에서 뒤로 버튼이 필요할 때 사용할 바 버튼 항목.

    ```
     var backBarButtonItem: UIBarButtonItem? { get set }
    ```

- hidesBackButton : 뒤로 버튼이 숨겨져 있는지를 결정하는 부울 값.

    ```
    var hidesBackButton: Bool { get set }
    ```

**주요 메서드**

- setHidesBackButton(_:animated:) : 뒤로 버튼이 숨겨져 있는지를 설정하고, 전환 애니메이션 효과 적용

    ```
    func setHidesBackButton(_ hidesBackButton: Bool, animated: Bool)
    ```

**네이베이션 아이템 커스터마이징**

---

 내비게이션 아이템은 크게 좌, 우 바 버튼 아이템과 중앙 타이틀 영역이 있다. 좌측 바 버튼, 우측 바 버튼 아이템의 경우 타입은 UIBarButtonItem 입니다. 그리고 상황에 따라서 커스텀 뷰를 넣어서 구현할 수도 있다.

 

**프로퍼티**

- titleView : 중앙 타이틀 영역의 뷰

    ```
     var titleView: UIView? { get set }

    // Tip : 중앙 타이틀 영역에 뷰를 상속받은 (UILabel, UIView, UIImageView 등등) 클래스들을 표현할 수 있습니다.
    ```

- leftBarButtonItems : 좌측 아이템 영역의 `UIBarButtonItem`의 바 버튼 아이템 배열

    ```
     var leftBarButtonItems: [UIBarButtonItem]? { get set }
    ```

- leftBarButtonItem : 좌측 아이템 영역의 `UIBarButtonItem` 중에 가장 좌측 바 버튼 아이템

    ```
     var leftBarButtonItem: UIBarButtonItem? { get set }
    ```

- rightBarButtonItems : 우측 아이템 영역의 `UIBarButtonItem`의 바 버튼 아이템 배열

    ```
     var rightBarButtonItems: [UIBarButtonItem]? { get set }
    ```

- rightBarButtonItem : 우측 아이템 영역의 `UIBarButtonItem` 중에 가증 우측 바 버튼 아이템

    ```
    var rightBarButtonItem: UIBarButtonItem? { get set }
    ```

**메서드**

- setLeftBarButtonItems(_:animated:) : 좌측 아이템 영역에 `UIBarButtonItem` 타입의 객체들을 순차적으로 설정하고 애니메이션 효과를 적용

    ```
     func setLeftBarButtonItems(_ items: [UIBarButtonItem]?, animated: Bool)
    ```

- setLeftBarButton(_:animated:) : 좌측 아이템 영역에 `UIBarButtonItem` 타입의 객체를 설정하고 애니메이션 효과를 적용

    ```
     func setLeftBarButton(_ item: UIBarButtonItem?, animated: Bool)
    ```

- setRightBarButtonItems(_:animated:) : 우측 내비게이션 아이템 영역에 `UIBarButtonItem` 타입의 객채들을 순차적으로 설정하고 애니메이션 효과를 적용

    ```
     func setRightBarButtonItems(_ items: [UIBarButtonItem]?, animated: Bool)
    ```

- setRightBarButton(_:animated:) : 우측 아이템 영역에 `UIBarButtonItem` 타입의 객체를 설정하고 애니메이션 효과를 적용

    ```
     func setRightBarButton(_ item: UIBarButtonItem?, animated: Bool)
    ```