# The Composable Architecture

[![CI](https://github.com/pointfreeco/swift-composable-architecture/workflows/CI/badge.svg)](https://github.com/pointfreeco/swift-composable-architecture/actions?query=workflow%3ACI)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fpointfreeco%2Fswift-composable-architecture%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/pointfreeco/swift-composable-architecture)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fpointfreeco%2Fswift-composable-architecture%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/pointfreeco/swift-composable-architecture)

Composable Architecture(TCA) 는 일관성있고 이해하기 쉬운 방식으로 구성, 테스트 등을 염두에 두고 어플리케이션을 개발할 수 있게끔 해주는 라이브러리입니다. SwiftUI, UIKit 뿐만 아니라 모든 apple 플랫폼(iOS, macOS, tvOS, watchOS) 등에서 사용 가능합니다. 

* [What is the Composable Architecture?](#what-is-the-composable-architecture)
* [Learn more](#learn-more)
* [Examples](#examples)
* [Basic usage](#basic-usage)
* [Supplemental libraries](#supplementary-libraries)
* [FAQ](#faq)
* [Requirements](#requirements)
* [Installation](#installation)
* [Documentation](#documentation)
* [Help](#help)
* [Translations](#translations)
* [Credits and thanks](#credits-and-thanks)
* [Other libraries](#other-libraries)

## What is the Composable Architecture?
이 라이브러리는 다양하고 복잡한 목적의 어플리케이션을 설계하기 위해 몇 가지 핵심 도구들을 제공합니다. 어플리케이션을 개발하면서 매일같이 맞닥뜨리는 여러가지 문제점들을 해결할 수 있는 매력적인 사례들을 제공합니다. 

* **State management**
  <br> 간단한 값 타입들을 이용해서 어플리케이션의 상태를 관리하고, 여러 페이지에서 상태를 공유해서 한 화면에서 상태가 변하면 다른 모든 화면들이 구독하게 할 수 있는 방법.

* **Composition**
  <br> 어떻게 하면 커다란 feature를 독립적인 모듈로 나뉘고 쉽게 붙여지는 여러 작은 컴포넌트들로 나누는 방법.

* **Side effects**
  <br> 애플리케이션의 특정 부분이 가장 테스트 가능하고 이해하기 쉬운 방식으로 외부와 대화하도록 하는 방법.

* **Testing**
  <br> 부분적인 테스트 뿐만 아니라 통합적인 테스트를 하는 방법. 이는 비지니스 로직이 어플리케이션 내에서 정상적으로 동작함을 보장할 수 있게 해준다.

* **Ergonomics**
  <br> 위의 모든 것을 가능한 한 적은 개념과 수정으로 간단한 API에서 수행하는 방법.

## Learn More

Composable Architecture 는 [Brandon Williams](https://twitter.com/mbrandonw) 과 [Stephen Celis](https://twitter.com/stephencelis) 이 진행하는 함수형 프로그래밍과 Swift 에 대해서 알아보는 비디오 시리즈인 [Point-Free](https://www.pointfree.co) 에서 여러 에피소드들에 걸쳐서 고안되어진 디자인 패턴이다. 

여기서 모든 에피소드들을 볼 수 있다. [here](https://www.pointfree.co/collections/composable-architecture), 더 많은 정보를 원한다면: [part 1](https://www.pointfree.co/collections/composable-architecture/a-tour-of-the-composable-architecture/ep100-a-tour-of-the-composable-architecture-part-1), [part 2](https://www.pointfree.co/collections/composable-architecture/a-tour-of-the-composable-architecture/ep101-a-tour-of-the-composable-architecture-part-2), [part 3](https://www.pointfree.co/collections/composable-architecture/a-tour-of-the-composable-architecture/ep102-a-tour-of-the-composable-architecture-part-3) and [part 4](https://www.pointfree.co/collections/composable-architecture/a-tour-of-the-composable-architecture/ep103-a-tour-of-the-composable-architecture-part-4).

<a href="https://www.pointfree.co/collections/composable-architecture">
  <img alt="video poster image" src="https://d3rccdn33rt8ze.cloudfront.net/episodes/0069.jpeg" width="600">
</a>

## Examples

[![Screen shots of example applications](https://d3rccdn33rt8ze.cloudfront.net/composable-architecture/demos.png)](./Examples)

이 레포지토리는 다양한 문제들을 Composable Architecture로 해결하는 방법에 대한 여러 예시들을 담고 있습니다. [여기](./Examples) 를 확인해보세요.

* [Case Studies](./Examples/CaseStudies)
  * Getting started
  * Effects
  * Navigation
  * Higher-order reducers
  * Reusable components
* [Location manager](https://github.com/pointfreeco/composable-core-location/tree/main/Examples/LocationManager)
* [Motion manager](https://github.com/pointfreeco/composable-core-motion/tree/main/Examples/MotionManager)
* [Search](./Examples/Search)
* [Speech Recognition](./Examples/SpeechRecognition)
* [Tic-Tac-Toe](./Examples/TicTacToe)
* [Todos](./Examples/Todos)
* [Voice memos](./Examples/VoiceMemos)

좀 더 실속 있는 걸 찾고 계신가요? [isowords](https://github.com/pointfreeco/isowords) 소스코드를 확인해보세요. SwiftUI와 Composable Architecture를 이용해서 만들어진 iOS 단어찾기 게임입니다. 

## Basic Usage

Composable Architecture 를 이용해서 기능을 만들기 위해 당신이 원하는 도메인을 모델링하기 위한 타입들과 값들을 정의합니다:

* **State**: 기능이 로직을 수행하고 UI를 그리기 위해서 필요한 데이터 타입
* **Action**: 기능에서 발생 가능한 모든 액션들을 나타내는 타입. 예를 들어 유저 액션, 알림, 이벤트 소스 등.
* **Environment**: API 클라이언트나 분석 클라이언트와 같이 기능이 필요로하는 의존성들을 담는 타입
* **Reducer**: 주어진 액션으로부터 현재의 상태를 앱의 다음 상태로 발전시키기 위한 함수 타입. 또한 API 요청과 같이 실행되어야 하는 모든 효과를 반환할 책임이 있으며, 이는 'Effect' 값을 반환함으로써 수행될 수 있다.
* **Store**: 기능을 실제로 구동하는 런타임. 모든 유저 액션을 store에 보내고 store는 reducer 와 effects 를 수행합니다. store를 구독함으로써 UI를 업데이트 시켜줄 수 있습니다. 

이렇게 하면 기능의 테스트 가능성을 즉시 확인할 수 있습니다. 그리고 크고 복잡한 기능을 다시 재조합 가능한 작은 범위로 나누어 작업할 수 있습니다. 

간단한 예로, "+" 와 "-" 버튼으로 증감되는 숫자를 보여주는 UI가 있다고 상상해봅시다. 해당 기능을 조금 더 재미있게 만들기 위해서 클릭하면 해당 숫자에 관한 재미있는 사실을 모달 형식으로 알려주는 API를 호출하는 버튼도 추가해봅시다. 

이 기능을 위한 상태로는, 현재 숫자를 보여주는 integer와 모달 형태로 띄워질 문구인 string 이 필요합니다. 

```swift
struct AppState: Equatable {
  var count = 0
  var numberFactAlert: String?
}
```

다음으로 우리는 액션이 필요합니다. 액션에는 "-" 버튼을 누르는것, "+" 버튼을 누르는것, "fun fact" 버튼을 누르는것, 유저가 모달창을 내리는 것, API 로부터 response를 전달받는 것 등의 액션들이 있습니다. 

```swift
enum AppAction: Equatable {
  case factAlertDismissed
  case decrementButtonTapped
  case incrementButtonTapped
  case numberFactButtonTapped
  case numberFactResponse(Result<String, ApiError>)
}

struct ApiError: Error, Equatable {}
```

다음으로 우리는 이 기능이 수행되기 위한 dependencies 환경을 모델링 해야합니다. 부분적으로, 숫자와 관련된 재미난 사실을 호출하기 위해서 네트워크 리퀘스트를 감싸줄 수 있는 `Effect` 가 필요합니다. 그래서 dependency는 `Int` 로부터 `Effect<String, ApiError>` 를 반환하는 함수입니다. `String`은 리퀘스트로부터 받아온 응답을 나타냅니다. 더 나아가, 해당 effect는 전형적으로 background thread 에서 기능을 수행합니다. 그리고 우리는 effect의 값을 main thread에서 받아옵니다. 이는 우리가 테스트를 쓸 수 있도록 통제해야하는 중요한 dependency 입니다. 우리는 Production에서는 라이브 `DispatchQueue` 를 사용하고, 테스트에서는 테스트 스케쥴러를 사용하기 위해서 `AnyScheduler` 를 사용해야 합니다. 


```swift
struct AppEnvironment {
  var mainQueue: AnySchedulerOf<DispatchQueue>
  var numberFact: (Int) -> Effect<String, ApiError>
}
```

다음으로 우리는 해당 영역을 위한 비즈니스 로직을 reducer에서 수행해야 합니다. 여기서는 현재의 상태를 어떻게 다음의 상태로 변화시키는지를 보여주고, 어떤 effect 들이 수행되어져야하는지 보여줍니다. 어떤 액션들은 effect를 수행하지 않아도 됩니다. 그런 경우에는 `.none` 을 return 합니다. 

```swift
let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
  switch action {
  case .factAlertDismissed:
    state.numberFactAlert = nil
    return .none

  case .decrementButtonTapped:
    state.count -= 1
    return .none

  case .incrementButtonTapped:
    state.count += 1
    return .none

  case .numberFactButtonTapped:
    return environment.numberFact(state.count)
      .receive(on: environment.mainQueue)
      .catchToEffect(AppAction.numberFactResponse)

  case let .numberFactResponse(.success(fact)):
    state.numberFactAlert = fact
    return .none

  case .numberFactResponse(.failure):
    state.numberFactAlert = "Could not load a number fact :("
    return .none
  }
}
```

And then finally we define the view that displays the feature. It holds onto a `Store<AppState, AppAction>` so that it can observe all changes to the state and re-render, and we can send all user actions to the store so that state changes. We must also introduce a struct wrapper around the fact alert to make it `Identifiable`, which the `.alert` view modifier requires:

그리고 마지막으로 우리는 구현한 기능을 보여주는 view 를 정의합니다. view는 `Store<AppState, AppAction>` 를 가지고 있습니다. 그래서 state의 모든 상태변화를 구독해서 화면을 re-rendering 시켜줄 수 있습니다. 또한 우리는 모든 액션을 store에게 전달해주어서 store가 state 를 업데이트 하게끔 해줍니다. 또한 fact alert 를 `Identifiable` wrapper로 감쌉니다. 이는 `.alert` view modifier가 필요로 합니다. 

<details>
  <summary>Source Code</summary>

  ```swift
  class AppViewController: UIViewController {
    let viewStore: ViewStore<AppState, AppAction>
    var cancellables: Set<AnyCancellable> = []

    init(store: Store<AppState, AppAction>) {
      self.viewStore = ViewStore(store)
      super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
      super.viewDidLoad()

      let countLabel = UILabel()
      let incrementButton = UIButton()
      let decrementButton = UIButton()
      let factButton = UIButton()

      // Omitted: Add subviews and set up constraints...

      self.viewStore.publisher
        .map { "\($0.count)" }
        .assign(to: \.text, on: countLabel)
        .store(in: &self.cancellables)

      self.viewStore.publisher.numberFactAlert
        .sink { [weak self] numberFactAlert in
          let alertController = UIAlertController(
            title: numberFactAlert, message: nil, preferredStyle: .alert
          )
          alertController.addAction(
            UIAlertAction(
              title: "Ok",
              style: .default,
              handler: { _ in self?.viewStore.send(.factAlertDismissed) }
            )
          )
          self?.present(alertController, animated: true, completion: nil)
        }
        .store(in: &self.cancellables)
    }

    @objc private func incrementButtonTapped() {
      self.viewStore.send(.incrementButtonTapped)
    }
    @objc private func decrementButtonTapped() {
      self.viewStore.send(.decrementButtonTapped)
    }
    @objc private func factButtonTapped() {
      self.viewStore.send(.numberFactButtonTapped)
    }
  }
  ```
</details>

sceneDelegate에서 해당 view를 렌더링하려고 하는 순간이, 의존성들을 주입하기에 가장 좋은 시기입니다. 우선 해당 문서에서는 실제 api 통신은 하지 않고, mocked string 을 반환하는 effect 를 주입하도록 하겠습니다.   
  
```swift
let appView = AppView(
  store: Store(
    initialState: AppState(),
    reducer: appReducer,
    environment: AppEnvironment(
      mainQueue: .main,
      numberFact: { number in Effect(value: "\(number) is a good number Brent") }
    )
  )
)
```

이걸로 충분합니다. 확실히 이는 vanilla swift 방식에 비해서 스텝이 조금 많은 편이긴 합니다만, 확실히 얻을 수 있는 장점들이 명확합니다. 다양한 액션 클로져와 관측 가능한 객체들 안에 비즈니스 로직이 분산되어지는 대신에, 일관적인 방식으로 상태를 관리할 수 있게 해주며, `side effect`를 간결하게 표현하는 방법을 제공합니다. 게다가 즉시 해당 로직을 부가적인 작업 없이 테스트도 가능하게 합니다. 

### Testing

테스트 하기 위해서, 우선은 `TestStore` 를 작성합니다. 이는 기준 `Store` 를 작성하는 방법과 동일한데, 테스트 친화적으로 dependency를 주입하면 됩니다. 예를 들어서, Production 에서는 `DispatchQueue.main` scheduler 를 사용하지만, 테스트에서는 test scheduler 를 사용해서 테스트 코드 내에서 인위적으로 queue를 대기하는 작업을 수행하지 않아도 되게 해줍니다. 

```swift
let scheduler = DispatchQueue.test

let store = TestStore(
  initialState: AppState(),
  reducer: appReducer,
  environment: AppEnvironment(
    mainQueue: scheduler.eraseToAnyScheduler(),
    numberFact: { number in Effect(value: "\(number) is a good number Brent") }
  )
)
```

test store를 생성하였기 때문에 우리는 유저의 전체적인 flow 를 테스트해볼 수 있게 되었습니다. 각각의 스텝은 우리의 액션이 state에 어떤 변화를 줄지 예측 가능하게 해줍니다. 더 나아가 API 테스트를 수행하게 되면 effect가 수행되어지는데, 이는 store에 mock 데이터를 넘겨주게 되고, 우리는 이를 통해 action이 제대로 수행되어짐을 테스트해볼수도 있습니다. 

  
아래의 테스트는 유저가 "+", "-" 버튼을 누르고, "number fact" 버튼을 눌러서 alert가 띄워지고, alert를 껐을때 alert message 가 사라졌는지 확인해보는 테스트 코드입니다. 
  
  

```swift
// Test that tapping on the increment/decrement buttons changes the count
store.send(.incrementButtonTapped) {
  $0.count = 1
}
store.send(.decrementButtonTapped) {
  $0.count = 0
}

// Test that tapping the fact button causes us to receive a response from the effect. Note
// that we have to advance the scheduler because we used `.receive(on:)` in the reducer.
store.send(.numberFactButtonTapped)

scheduler.advance()
store.receive(.numberFactResponse(.success("0 is a good number Brent"))) {
  $0.numberFactAlert = "0 is a good number Brent"
}

// And finally dismiss the alert
store.send(.factAlertDismissed) {
  $0.numberFactAlert = nil
}
```

Composable Architecture 를 활용해서 기능을 빌드하고 테스트하는 기본적인 방법에 대해서 알아보았습니다. 더 심화된 과정에 대해서 둘러보고 싶다면 [Examples](./Examples) 를 둘러보면 다양한 프로젝트들을 보면서 활용법들을 직접 익히실 수 있습니다. 

### Debugging

The Composable Architecture comes with a number of tools to aid in debugging.

* `reducer.debug()` enhances a reducer with debug-printing that describes every action the reducer receives and every mutation it makes to state.

    ``` diff
    received action:
      AppAction.todoCheckboxTapped(id: UUID(5834811A-83B4-4E5E-BCD3-8A38F6BDCA90))
      AppState(
        todos: [
          Todo(
    -       isComplete: false,
    +       isComplete: true,
            description: "Milk",
            id: 5834811A-83B4-4E5E-BCD3-8A38F6BDCA90
          ),
          … (2 unchanged)
        ]
      )
    ```

* `reducer.signpost()` instruments a reducer with signposts so that you can gain insight into how long actions take to execute, and when effects are running.

    <img src="https://s3.amazonaws.com/pointfreeco-production/point-free-pointers/0044-signposts-cover.jpg" width="600">

## Supplementary libraries

One of the most important principles of the Composable Architecture is that side effects are never performed directly, but instead are wrapped in the `Effect` type, returned from reducers, and then the `Store` later performs the effect. This is crucial for simplifying how data flows through an application, and for gaining testability on the full end-to-end cycle of user action to effect execution.

However, this also means that many libraries and SDKs you interact with on a daily basis need to be retrofitted to be a little more friendly to the Composable Architecture style. That's why we'd like to ease the pain of using some of Apple's most popular frameworks by providing wrapper libraries that expose their functionality in a way that plays nicely with our library. So far we support:

* [`ComposableCoreLocation`](https://github.com/pointfreeco/composable-core-location): A wrapper around `CLLocationManager` that makes it easy to use from a reducer, and easy to write tests for how your logic interacts with `CLLocationManager`'s functionality.
* [`ComposableCoreMotion`](https://github.com/pointfreeco/composable-core-motion): A wrapper around `CMMotionManager` that makes it easy to use from a reducer, and easy to write tests for how your logic interacts with `CMMotionManager`'s functionality.
* More to come soon. Keep an eye out 😉

If you are interested in contributing a wrapper library for a framework that we have not yet covered, feel free to open an issue expressing your interest so that we can discuss a path forward.

## FAQ

* How does the Composable Architecture compare to Elm, Redux, and others?
  <details>
    <summary>Expand to see answer</summary>
    The Composable Architecture (TCA) is built on a foundation of ideas popularized by the Elm Architecture (TEA) and Redux, but made to feel at home in the Swift language and on Apple's platforms.

    In some ways TCA is a little more opinionated than the other libraries. For example, Redux is not prescriptive with how one executes side effects, but TCA requires all side effects to be modeled in the `Effect` type and returned from the reducer.

    In other ways TCA is a little more lax than the other libraries. For example, Elm controls what kinds of effects can be created via the `Cmd` type, but TCA allows an escape hatch to any kind of effect since `Effect` conforms to the Combine `Publisher` protocol.

    And then there are certain things that TCA prioritizes highly that are not points of focus for Redux, Elm, or most other libraries. For example, composition is very important aspect of TCA, which is the process of breaking down large features into smaller units that can be glued together. This is accomplished with the `pullback` and `combine` operators on reducers, and it aids in handling complex features as well as modularization for a better-isolated code base and improved compile times.
  </details>

* Why isn't `Store` thread-safe? <br> Why isn't `send` queued? <br> Why isn't `send` run on the main thread?
  <details>
    <summary>Expand to see answer</summary>

    All interactions with an instance of `Store` (including all of its scopes and derived `ViewStore`s) must be done on the same thread. If the store is powering a SwiftUI or UIKit view then, all interactions must be done on the _main_ thread.

    When an action is sent to the `Store`, a reducer is run on the current state, and this process cannot be done from multiple threads. A possible work around is to use a queue in `send`s implementation, but this introduces a few new complications:

    1. If done simply with `DispatchQueue.main.async` you will incur a thread hop even when you are already on the main thread. This can lead to unexpected behavior in UIKit and SwiftUI, where sometimes you are required to do work synchronously, such as in animation blocks.

    2. It is possible to create a scheduler that performs its work immediately when on the main thread and otherwise uses `DispatchQueue.main.async` (_e.g._ see [CombineScheduler](https://github.com/pointfreeco/combine-schedulers)'s [`UIScheduler`](https://github.com/pointfreeco/combine-schedulers/blob/main/Sources/CombineSchedulers/UIScheduler.swift)). This introduces a lot more complexity, and should probably not be adopted without having a very good reason.

    This is why we require all actions be sent from the same thread. This requirement is in the same spirit of how `URLSession` and other Apple APIs are designed. Those APIs tend to deliver their outputs on whatever thread is most convenient for them, and then it is your responsibility to dispatch back to the main queue if that's what you need. The Composable Architecture makes you responsible for making sure to send actions on the main thread. If you are using an effect that may deliver its output on a non-main thread, you must explicitly perform `.receive(on:)` in order to force it back on the main thread.

    This approach makes the fewest number of assumptions about how effects are created and transformed, and prevents unnecessary thread hops and re-dispatching. It also provides some testing benefits. If your effects are not responsible for their own scheduling, then in tests all of the effects would run synchronously and immediately. You would not be able to test how multiple in-flight effects interleave with each other and affect the state of your application. However, by leaving scheduling out of the `Store` we get to test these aspects of our effects if we so desire, or we can ignore if we prefer. We have that flexibility.

    However, if you are still not a fan of our choice, then never fear! The Composable Architecture is flexible enough to allow you to introduce this functionality yourself if you so desire. It is possible to create a higher-order reducer that can force all effects to deliver their output on the main thread, regardless of where the effect does its work:

    ```swift
    extension Reducer {
      func receive<S: Scheduler>(on scheduler: S) -> Self {
        Self { state, action, environment in
          self(&state, action, environment)
            .receive(on: scheduler)
            .eraseToEffect()
        }
      }
    }
    ```

    You would probably still want something like a `UIScheduler` so that you don't needlessly perform thread hops.
  </details>

## Requirements

The Composable Architecture depends on the Combine framework, so it requires minimum deployment targets of iOS 13, macOS 10.15, Mac Catalyst 13, tvOS 13, and watchOS 6. If your application must support older OSes, there are forks for [ReactiveSwift](https://github.com/trading-point/reactiveswift-composable-architecture) and [RxSwift](https://github.com/dannyhertz/rxswift-composable-architecture) that you can adopt!

## Installation

You can add ComposableArchitecture to an Xcode project by adding it as a package dependency.

  1. From the **File** menu, select **Add Packages...**
  2. Enter "https://github.com/pointfreeco/swift-composable-architecture" into the package repository URL text field
  3. Depending on how your project is structured:
      - If you have a single application target that needs access to the library, then add **ComposableArchitecture** directly to your application.
      - If you want to use this library from multiple Xcode targets, or mixing Xcode targets and SPM targets, you must create a shared framework that depends on **ComposableArchitecture** and then depend on that framework in all of your targets. For an example of this, check out the [Tic-Tac-Toe](./Examples/TicTacToe) demo application, which splits lots of features into modules and consumes the static library in this fashion using the **tic-tac-toe** Swift package.

## Documentation

The latest documentation for the Composable Architecture APIs is available [here](https://pointfreeco.github.io/swift-composable-architecture/).

## Help

If you want to discuss the Composable Architecture or have a question about how to use it to solve a particular problem, you can start a topic in the [discussions](https://github.com/pointfreeco/swift-composable-architecture/discussions) tab of this repo, or ask around on [its Swift forum](https://forums.swift.org/c/related-projects/swift-composable-architecture).

## Translations

The following translations of this README have been contributed by members of the community:

* [Arabic](https://gist.github.com/NorhanBoghdadi/1b98d55c02b683ddef7e05c2ebcccd47)
* [French](https://gist.github.com/nikitamounier/0e93eb832cf389db12f9a69da030a2dc)
* [Indonesian](https://gist.github.com/wendyliga/792ea9ac5cc887f59de70a9e39cc7343)
* [Italian](https://gist.github.com/Bellaposa/5114e6d4d55fdb1388e8186886d48958)
* [Korean](https://gist.github.com/pilgwon/ea05e2207ab68bdd1f49dff97b293b17)
* [Simplified Chinese](https://gist.github.com/sh3l6orrr/10c8f7c634a892a9c37214f3211242ad)

If you'd like to contribute a translation, please [open a PR](https://github.com/pointfreeco/swift-composable-architecture/edit/main/README.md) with a link to a [Gist](https://gist.github.com)!

## Credits and thanks

The following people gave feedback on the library at its early stages and helped make the library what it is today:

Paul Colton, Kaan Dedeoglu, Matt Diephouse, Josef Doležal, Eimantas, Matthew Johnson, George Kaimakas, Nikita Leonov, Christopher Liscio, Jeffrey Macko, Alejandro Martinez, Shai Mishali, Willis Plummer, Simon-Pierre Roy, Justin Price, Sven A. Schmidt, Kyle Sherman, Petr Šíma, Jasdev Singh, Maxim Smirnov, Ryan Stone, Daniel Hollis Tavares, and all of the [Point-Free](https://www.pointfree.co) subscribers 😁.

Special thanks to [Chris Liscio](https://twitter.com/liscio) who helped us work through many strange SwiftUI quirks and helped refine the final API.

And thanks to [Shai Mishali](https://github.com/freak4pc) and the [CombineCommunity](https://github.com/CombineCommunity/CombineExt/) project, from which we took their implementation of `Publishers.Create`, which we use in `Effect` to help bridge delegate and callback-based APIs, making it much easier to interface with 3rd party frameworks.

## Other libraries

The Composable Architecture was built on a foundation of ideas started by other libraries, in particular [Elm](https://elm-lang.org) and [Redux](https://redux.js.org/).

There are also many architecture libraries in the Swift and iOS community. Each one of these has their own set of priorities and trade-offs that differ from the Composable Architecture.

* [RIBs](https://github.com/uber/RIBs)
* [Loop](https://github.com/ReactiveCocoa/Loop)
* [ReSwift](https://github.com/ReSwift/ReSwift)
* [Workflow](https://github.com/square/workflow)
* [ReactorKit](https://github.com/ReactorKit/ReactorKit)
* [RxFeedback](https://github.com/NoTests/RxFeedback.swift)
* [Mobius.swift](https://github.com/spotify/mobius.swift)
* <details>
  <summary>And more</summary>

  * [Fluxor](https://github.com/FluxorOrg/Fluxor)
  * [PromisedArchitectureKit](https://github.com/RPallas92/PromisedArchitectureKit)
  </details>

## License

This library is released under the MIT license. See [LICENSE](LICENSE) for details.
