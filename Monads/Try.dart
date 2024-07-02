class Try<T> {
  final T? _value;
  final Exception? _error;
  final bool _isSuccess;

  Try._(this._value, this._error, this._isSuccess);

  static Try<T> success<T>(T value) => Try._(value, null, true);
  static Try<T> failure<T>(Exception error) => Try._(null, error, false);

  bool isSuccess() => _isSuccess;
  bool isFailure() => !_isSuccess;

  T getValue() {
    if (!isSuccess()) {
      throw _error!;
    }
    return _value!;
  }

  Exception getError() {
    if (isSuccess()) {
      throw Exception("No error present");
    }
    return _error!;
  }
}
