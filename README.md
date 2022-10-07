The collection of useful utils and architecture base classes.

# It consists of

- [`response_parser`](https://pub.dev/packages/response_parser) - helps to
  parse responses and errors, and map them to the convenient `Either` format.
- [`fpdart`](https://pub.dev/packages/fpdart) and `functional_extensions` - main 
  functional programming types and patterns.
- `action_bloc` - subtype of the bloc which converts an action execution to the
  `inProgress` and `success`/`failure` state.
- `reactive_facade` - helps to make the work with the infrastracture layer reactive. 
