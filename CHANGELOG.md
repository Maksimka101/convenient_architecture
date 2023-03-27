## [0.1.2]

- Upgrade packages
- Add the `absent` and `constF` methods

## [0.1.1]

- Upgrade packages

## [0.1.0+1]

- Back `data` getter to the `FacadeConsumerState`.

## [0.1.0]

- Add `isInitial`, `isInProgress`, `isSuccess` and `isFailure` getters for the
  `IVoidActionBlocState` and `IActionBlocState`.
- **BREAKING** Update the `ReactiveFacadeConsumerCubit`:
  - rename it to the `FacadeConsumerCubit`
  - update its state:
    - rename it to the `FacadeConsumerState`
    - add `FacadeConsumerState.loaded` constructor instead of the default one
      and make the `data` argument positional (previously it was named)
    - add `whenOrNull` method
    - add `isInitial` and `isLoaded` getters
- Add facade tests.

## 0.0.6

- Add `DisposableStreamListenableMixin` and `BlocStreamListenableMixin`. They
  are maintain stream subscriptions for `Disposable` and `Bloc`s.

## 0.0.5

- Update the `PaginationInfo`. Now it has required `idExtractor` parameter.

## 0.0.4

- Update the `PaginationData`:
  - rename it to the `PaginationInfo`.
  - rename its old `PaginationData.data` field to the `PaginationInfo.items`.
  - add a new methods that can be used to update the pagination info:
    - `addItems` method to add a new items to the existing.
    - `addItem` method to add a new item to the existing.
    - `removeItem` method to remove an item from the existing items. 
- Add documentation to the `ActionCubit`, `ReactiveFacadeConsumerCubit` and `ReactiveFacade`

## 0.0.3

- Fix action bloc's state mappers

## 0.0.2

- Export `ReactiveFacadeConsumerCubit`.
- Add an example app.

## 0.0.1

- Initial version.
