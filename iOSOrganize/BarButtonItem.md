# Bar Button Item

바 버튼 아이템은 UIToolbar 또는 UINavigationBar (backBarButtonItem,leftBarButtonItem,rightBarButtonItem등)에 배치할 수 있는 특수한 버튼. 제목이나 이미지를 보여줄 수 있고 미리 UIBarButtonItem.SystemItem 열거형에 정의된 여러 스타일 중 하나의 스타일로 선택할 수도 있다.

Tip : iOS 11에서는 UIBarButtonItem을 오토레이아웃 제약 없이 내비게이션 아이템으로 추가하면 바 버튼 아이템의 프레임이 예상치 못한 크기로 나올 수 있다. 이럴 땐 UIBarButtonItem 객체에 적절한 오토레이아웃 제약을 추가한 후 내비게이션 아이템으로 설정하면 설정한 제약에 따라 알맞은 크기로 볼 수 있다.

**주요 프로퍼티**

- title : 아이템에 표시되는 제목.

    ```
     var title: String? { get set }
    ```

- image : 아이템에 표시되는 이미지.

    ```
     var image: UIImage? { get set }
    ```

- style : 아이템의 스타일.

    ```
     var style: UIBarButtonItem.Style { get set }
    ```

- width : 아이템의 너비 값.

    ```
     var width: CGFloat { get set }
    ```

- tintColor : 아이템에 적용할 색상

    ```
     var tintColor: UIColor? { get set }
    ```

**주요 상수**

- UIBarButtonItem.Style : 아이템 스타일 정의.
- UIBarButtonItem.SystemItem : 바 버튼 아이템에 대한 시스템 제공 스타일.