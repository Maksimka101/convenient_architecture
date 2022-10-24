# It is alpha

Some API may be changed. 

---

The collection of useful utils and architecture base classes.

## It consists of

- [`response_parser`](https://pub.dev/packages/response_parser) - helps to
  parse responses and errors, and map them to the convenient `Either` format.
- [`fpdart`](https://pub.dev/packages/fpdart) and `functional_extensions` - main 
  functional programming types and patterns.
- `action_bloc` - subtype of the bloc which converts an action execution to the
- `reactive_facade_consumer_cubit` - cubit which shortcuts the subscribing and listening to the reactive facade
  `inProgress` and `success`/`failure` state.
- `reactive_facade` - helps to make the work with the infrastracture layer reactive. 

Take a look at the example app to see these parts in action
