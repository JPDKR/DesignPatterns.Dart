class Result<T> {
  final T? value;
  final String? error;
  final bool isSuccess;

  Result._(this.value, this.error, this.isSuccess);

  factory Result.success(T value) {
    return Result._(value, null, true);
  }

  factory Result.failure(String error) {
    return Result._(null, error, false);
  }
}

// Ejemplo de uso
Result<int> divide(int numerator, int denominator) {
  if (denominator == 0) {
    return Result.failure("Division by zero error.");
  } else {
    return Result.success(numerator ~/ denominator);
  }
}

void main() {
  var result = divide(10, 2);

  if (result.isSuccess) {
    print("Result: ${result.value}");
  } else {
    print("Error: ${result.error}");
  }
}
