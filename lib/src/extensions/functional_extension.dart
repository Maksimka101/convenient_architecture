extension FunctionalExtension<T> on T {
  /// Extension to apply some function on the value.
  ///
  /// Can be used to:
  /// - map value in the functional style and do non nullable calculations on the nullable value:
  ///   ```dart
  ///   UserEntity toEntity(UserDto dto) {
  ///     return UserEntity(
  ///       image: dto.image?.let(ImageEntity.fromDto),
  ///     );
  ///   }
  ///   ```
  ///   instead of
  ///   ```dart
  ///   UserEntity toEntity(UserDto dto) {
  ///     return UserEntity(
  ///       image: dto.image != null ImageEntity.fromDto(dto.image!) : null,
  ///     );
  ///   }
  ///   ```
  /// - convert imperative calls to the method calls
  ///   ```dart
  ///   B convertToB(A a);
  ///   C convertToC(B b);
  ///
  ///   void main() {
  ///     C c = something
  ///       .getA()
  ///       .let(convertToB)
  ///       .let(convertToC);
  ///   }
  ///   ```
  Q let<Q>(Q Function(T it) mapper) => mapper(this);
}
