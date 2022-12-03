# It is alpha
Some API may be changed. 

---

The collection of useful utils and architecture base classes.

## It consists of
- [`response_parser`](https://pub.dev/packages/response_parser) - helps to
  parse responses and errors, and map them to the convenient `Either` format.
- [`fpdart`](https://pub.dev/packages/fpdart) and `functional_extensions` - main 
  functional programming types and patterns.
- [`action_bloc`](#action-blocs) - subtype of the bloc which converts an action execution to the
  `inProgress` and `success`/`failure` states.
- [`facade_consumer_cubit`](#facade-consumer-cubit) - cubit which shortcuts the subscribing and 
  listening to the reactive facade.
- [`reactive_facade`](#reactive-facade) - helps to make the work with the infrastracture layer reactive. 

Take a look at the example app to see these parts in action

## Action blocs
Action bloc is used to automatically map `action` to the states. It's supposed to
be used with the `ReactiveFacade`.

`action` is a function which performs an action that should be mapped to the states.
It may be similar to the `FutureBuilder` which also maps action to the states however
action blocs are more advanced.

It works this way:
- event is added
  - action is performed
    - before actions is performed `in progress` state is emitted
    - when action is successfully performed `success` state is emitted
    - in case of failure `failure` state with an error is emitted.
    
To map an `action` to the states bloc is using `IStateAdapter`. 
This is an adapter provided by user which takes an action with event, executes it
and returns an `Either` of result or error.

### Facade consumer cubit
It's a base for the cubit which listens to the `ReactiveFacade.dataStream`.

## Reactive facade
As you may know facade is a [pattern](https://refactoring.guru/design-patterns/facade)
which provides a simplified interface to complex set of classes.
In our case these classes are api and local repositories.

**Reactive Facade's goal** is to be a single source of truth, hide the data synchronization
and provide the reactive api.
