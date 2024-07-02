class Maybe<T> {
  final T? _value;
  final bool _isPresent;

  Maybe._(this._value, this._isPresent);

  static Maybe<T> some<T>(T value) => Maybe._(value, true);
  static Maybe<T> none<T>() => Maybe._(null, false);

  bool isPresent() => _isPresent;

  T get() {
    if (!isPresent()) {
      throw Exception("No value present");
    }
    return _value!;
  }
}