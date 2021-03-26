# AutoLayout Code

**NSLayoutConstraint**

---

- NSLayourConstraing
    - view1.attr1 = view2.attr2 * multiplier + constant
    - item.attribute = toltem.attribute * multiplier + constant
        - item - 제약조건을 받는 뷰(왼쪽)
        - relatedBy - 제약조건을 받는 뷰 간의 관계
            - NSLayoutRelation 열거형 값을 가짐(.lessThanOrEqual, .equal, .greaterThanOrEqual)
        - attribute - 뷰(왼쪽)의 제약조건의 속성
            - NSLayoutAttribute 열거형 값을 가짐(.left, .right, .top, .bottom, .leading, .trailing, .width, .height, .centerX, .centerY, .lastBaseline, .notAnAttribute 등)
        - toltem - 뷰(왼쪽)의 제약조건을 받을 뷰(오른쪽)이다.
            - 없을경우 nil이 가능.
        - attribute - 뷰(오른쪽)의 제약 조건의 속성
            - NSLayoutAttribute 열거형 값을 가짐(.left, .right, .top, .bottom, .leading, .trailing, .width, .height, .centerX, .centerY, .lastBaseline, .notAnAttribute 등)
        - multiplier - 뷰(왼쪽)의 속성값을 얻기 위해 뷰(오른쪽)의 속성값을 곱함
            - 이 값을 이용해 비율로 크기를 설정할 수 있고, 위치지정에도 활용할 수 있다.
        - constant - 상수 값이다.
            - 비율(multiplier)의 값이 아닌 상수의 값이 필요한 경우에 사용.

- button과 textField에 기본간격(Standard Space)에 제약을 주기 위해 NSLayoutConstraint 인스턴스를 생성하는 코드

```
 NSLayoutConstraint(item: button,
 			  attribute: .right,
 			  relatedBy: .equal,
 			  toItem: textField,
 			  attribute: .left,
 			  multiplier: 1.0,
 			  constant: 8.0)
```

- button의 너비가 50보다 크거나 같도록 넓이 제약(Width Constraint)를 줄 수 있는 NSLayoutConstraint 인스턴스 생성 코드

```
NSLayoutConstraint(item: button,
 			  attribute: .width,
 			  relatedBy: .greaterThanOrEqual,
 			  toItem: nil,
 			  attribute: .notAnAttribute,
 			  multiplier: 1.0,
 			  constant: 50.0)
```

- purpleBox가 superView를 기준으로 왼쪽(Leading) 간격은 50포인트, 오른쪽(Trailing) 간격은 50포인트로 설정. (Connection to Superview)

```
 NSLayoutConstraint(item: purpleBox,
 			  attribute: .left,
 			  relatedBy: .equal,
 			  toItem: self.view,
 			  attribute: .left,
 			  multiplier: 1.0,
 			  constant: 50.0)

 NSLayoutConstraint(item: purpleBox,
 			  attribute: .right,
 			  relatedBy: .equal,
 			  toItem: self.view,
 			  attribute: .right,
 			  multiplier: 1.0,
 			  constant: -50.0)
```

- topField와 bottomField의 세로 사이의 간격을 10포인트로 설정.(Verticla Layout)

```
NSLayoutConstraint(item: topField,
 			  attribute: .bottom,
 			  relatedBy: .equal,
 			  toItem: bottomField,
 			  attribute: .top,
 			  multiplier: 1.0,
 			  constant: -10.0)
```

- maroonView와 blueView의 간격이 없음.(Flush Views)

```
 NSLayoutConstraint(item: maroonView,
 			  attribute: .right,
 			  relatedBy: .equal,
 			  toItem: blueView,
 			  attribute: .left,
 			  multiplier: 1.0,
 			  constant: 0.0)
```

- button의 너비는 100포인트이고 우선도는 20으로 설정. (Priority)
    - 오토레이아웃에서는 뷰에 제약을 적용할 때, 어떤 제약을 우선시해야 하는지를 우선도로 결정. 만약, 하나의 속성(Attribute)에 적용할 수 있는 두 개 이상의 제약이 있다면 그 중 우선도가 높은 제약이 적용됨. 우선도는 1부터 1000까지의 정수로 표현가능.

```
NSLayoutConstraint(item: button,
 			  attribute: .width,
 			  relatedBy: .equal,
 			  toItem: nil,
 			  attribute: .notAnAttribute,
 			  multiplier: 1.0,
 			  constant: 100.0).priority = UILayoutPriority(rawValue: 20)
```

- flexibleButton의 너비 값이 70포인트보다 크거나 같고 100포인트보다 작거나 같도록 제약을 생성. (Multiple Predicates)

```
 NSLayoutConstraint(item: flexibleButton,
 			  attribute: .width,
 			  relatedBy: .greaterThanOrEqual,
 			  toItem: nil,
 			  attribute: .notAnAttribute,
 			  multiplier: 1.0,
 			  constant: 70.0)

 NSLayoutConstraint(item: flexibleButton,
 			  attribute: .width,
 			  relatedBy: .lessThanOrEqual,
 			  toItem: nil,
 			  attribute: .notAnAttribute,
 			  multiplier: 1.0,
 			  constant: 100.0)
```

- button1, button2, textField와 superView의 간격은 표준 간격이며, textField의 너비 값은 20포인트보다 크거나 같도록 제약을 생성. (A Complete Line of Layout)

```
 // button1
 NSLayoutConstraint(item: button1,
 			  attribute: .left,
 			  relatedBy: .equal,
 			  toItem: self.view,
 			  attribute: .left,
 			  multiplier: 1.0,
 			  constant: 8.0)

 // button2
 NSLayoutConstraint(item: button2,
 			  attribute: .left,
 			  relatedBy: .equal,
 			  toItem: button1,
 			  attribute: .right,
 			  multiplier: 1.0,
 			  constant: 8.0)

 // textField
 NSLayoutConstraint(item: textField,
 			  attribute: .left,
 			  relatedBy: .equal,
 			  toItem: button2,
 			  attribute: .right,
 			  multiplier: 1.0,
 			  constant: 8.0)

 NSLayoutConstraint(item: textField,
 			  attribute: .width,
 			  relatedBy: .greaterThanOrEqual,
 			  toItem: nil,
 			  attribute: .notAnAttribute,
 			  multiplier: 1.0,
 			  constant: 20.0)

 NSLayoutConstraint(item: textField,
 			  attribute: .right,
 			  relatedBy: .equal,
 			  toItem: self.view,
 			  attribute: .right,
 			  multiplier: 1.0,
 			  constant: -8.0)
```

**Visual Format Language**

---

- 기호 및 문자열
    - | : superView 이다.
    - - : 표준 간격이다.
    - == : 같은 너비이다.
    - -10- : 사이의 간격이 10포인트
    - <=50 : 50보다 작거나 같음.
    - >= 50보다 크거나 같음.
    - @750 : 우선도를 지정 가능.
    - H : 수평 방향(가로)
    - V : 수직 방향(세로)