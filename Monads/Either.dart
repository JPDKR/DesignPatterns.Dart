class Either<L, R> {
  final L? _left;
  final R? _right;
  final bool _isLeft;

  Either._(this._left, this._right, this._isLeft);

  static Either<L, R> left<L, R>(L value) => Either._(value, null, true);
  static Either<L, R> right<L, R>(R value) => Either._(null, value, false);

  bool isLeft() => _isLeft;
  bool isRight() => !_isLeft;

  L getLeft() {
    if (!isLeft()) {
      throw Exception("Not a left value");
    }
    return _left!;
  }

  R getRight() {
    if (!isRight()) {
      throw Exception("Not a right value");
    }
    return _right!;
  }
}
