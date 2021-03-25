# UIButton, UISlider, UILabel

**UIButton**

---

- 버튼과 연결되는 메서드 형식은 3가지가 있음.
    - func doSomething()
    - func doSomething(sender: UIButton)
    - func doSomething(sender: UIButton, forEvent event: UIEvent)

- 버튼의 상태는 5가지로 표현될 수 있음
    - default, highlighted, focused, selected, disabled
    - 버튼의 상태는 조합된 상태일 수 있다.
    - 버튼 생성시 기본 값은 default, 사용자와 상호작용하면서 상태 값이 변경

- 버튼의 주요 프로퍼티
    - enum UIButtonType: 버튼의 유형
    - 버튼의 유형에 따라 버튼의 기본적인 외형과 동작이 달라짐.
    - 처음 버튼을 생성할 때 init(type: )메서드를 이용하거나, 인터페이스 빌더의 "Attribute Inspector"에서 버튼 유형을 지정 가능.
    - 한번 생성된 버튼의 유형은 이후 변경할 수 없다.

- var titleLabel: UILabel?: 버튼 타이틀 레이블
- var imageView: UIImageView?: 버튼의 이미지 뷰
- var tintColor: UIColor! 버튼 타이틀과 이미지의 틴트 컬러.

- 주요 메서드

    ```
    // 특정 상태의 버튼의 문자열 설정
    func setTitle(String?, for: UIControlState)
    ```

    ```
    // 특정 상태의 버튼의 문자열 반환
    func title(for: UIControlState) -> String?
    ```

    ```
    // 특정 상태의 버튼 이미지 설정
    func setImage(UIImage?, for: UIControlState)
    ```

    ```
    // 특정 상태의 버튼 이미지 반환
    func image(for: UIControlState) -> UIImage?
    ```

    ```
    // 특정 상태의 백그라운드 이미지 설정
    func setBackgroundImage(UIImage?, for: UIControlState)
    ```

    ```
    // 특정 상태의 백그라운드 이미지 반환
    func backgroundImage(for: UIControlState) -> UIImage?
    ```

    ```
    // 특정 상태의 문자열 색상 설정
    func setTitleColor(UIColor?, for: UIControlState)
    ```

    ```
    // 특정 상태의 attributed 문자열 설정
    func setAttributedTitle(NSAttributedString?, for: UIControlState)
    ```

    **UILabel**

    ---

    - 레이블의 주요 프로퍼티
        - 레이블의 프로퍼티에 접근해 나타내려는 문자의 내용, 색상, 폰트, 문자열 정렬 방식, 라인 수 등을 조정할 수 있다.
        - 레이블의  프로퍼티의 값을 설정하는 방식에는 프로그래밍 방식과 스토리보드의 인스펙터를 이용한 방법이 있다.

    - var text: String?: 레이블이 표시할 문자열
        - 문자열이 모두 동일한 속성(폰트, 색상, 기울임꼴 등)으로 표시됨.
        - text 프로퍼티에 값을 할당하면 attributedText 프로퍼티에도 똑같은 내용의 문자열이 할당됨.
    - var attributedText: NSAttributedString?: 레이블이 표시할 속성 문자열
        - NSAttributed 클래스를 사용한 속성 문자열 중 특정 부분의 속성을 변경할 수 있음.
        - attributedText: NsAttrib:tedString?: 레이블이 표시할 속성 문자열
    - var textColor: UIColor!: 문자 색상
    - var font: UIFont!: 문자 폰트
    - var textAlignment: NSTextAlignment: 문자열의 가로 정렬 방식
        - left, right, center, justified, natural 중 하나를 선택 가능.
    - var numberOfLines: Int: 문자를 나타내는 최대 라인 수
        - 문자열을 모두 표시하는 데 필요한 만큼 행을 사용하려면 0으로 설정. 기본 값은 1
        - 설정한 문자열이 최대 라인 수를 초과하면 lineBreakMode 프로퍼티의 값에 따라 적절히 잘라서 표현
        - adjustsFontSizeToFitWidth 프로퍼티를 활용하면 폰트 사이즈를 레이블의 넓이에 따라 자동으로 조절.
    - var vaselineAdjustment: UIBaselineAdjustment: 문자열이 Autoshrink 되었을 때의 수직 정렬 방식
        - Align Baseline: 문자가 작아졌을 때 기존 문자열의 기준선에 맞춤
        - Align Center: 문자가 작아졌을 때 작아진 문자의 중앙선에 맞춤.
        - None: 문자가 작아졌을 때 기존 문자열의 위쪽 선에 맞춤.
    - var lineBreakMode: NSLineBreakMode: 레이블의 경계선을 벗어나는 문자열에 대응하는 방식
        - Character wrap: 여러 줄 레이블에 주로 적용되며, 글자 단위로 줄 바꿈을 결정.
        - Word wrap: 여러 줄 레이블에 주로 적용되며, 단어 단위로 줄 바꿈을 결정.
        - Truncate head: 한 줄 레이블에 주로 적용되며, 앞쪽 텍스트를 자르고 ...으로 표시.
        - Truncate middle: 한 줄 레이블에 주로 적용되며, 중간 텍스트를 자르고 ...으로 표시.
        - Truncate tail: 한 줄 레이블에 주로 적용되며, 끝쪽 텍스트를 자르고 ...으로 표시. 기본 설정 값

**UISlider**

---

![UIButton,%20UISlider,%20UILabel%20c38876c71e964b8b8c87510748f427a9/Untitled.png](UIButton,%20UISlider,%20UILabel%20c38876c71e964b8b8c87510748f427a9/Untitled.png)

- 연결하는 메서드 형식

```
func doSomething()
func doSomething(sender: UISlider)
func doSomething(sender: UISlider, forEvent event: UIEvent)
```

- 주요 프로퍼티
    - var minimumValue: Float, var maximumValue: Float: 슬라이더 양끝단의 값
    - var value: Float: 슬라이더의 현재 값.
    - var isContinuous: Bool: 슬라이더의 연속적인 값 변화에 따라 이벤트 역시 연속적으로 호출할 것인지 여부
    - var minimumValueImage: UIImage?, var maximumValueImage: UIImage?: 슬라이더 양끝단의 이미지
    - var minimumTrackTintColor: UIColor?, var maximumTrackTintColor: UIColor?: thumb를 기준으로 앞쪽 트랙과 뒤쪽 트랙의 틴트 색상.

- 주요 메서드

```
//  슬라이더의 현재 값 설정
func setValue(Float, animated: Bool)
```

```
//  특정 상태의 minimumTrackImage 반환
func minimumTrackImage(for: UIControlState) -> UIImage?
```

```
// 특정 상태의 minimumTrackImage 설정
func setMinimumTrackImage(UIImage?, for: UIControlState)
```

```
// 특정 상태의 maximumTrackImage 반환
func maximumTrackImage(for: UIControlState) -> UIImage?
```

```
// 특정 상태의 minimumTrackImage 설정
func setMaximumTrackImage(UIImage?, for: UIControlState)
```

```
//  특정 상태의 thumbImage 반환
func thumbImage(for: UIControlState) -> UIImage?
```

```
//특정 상태의 thumbImage 설정
func setThumbImage(UIImage?, for: UIControlState)
```

해당 문서는 네이버 부스트 캠프, 애플 공식 문서를 참고하여 작성되었습니다.