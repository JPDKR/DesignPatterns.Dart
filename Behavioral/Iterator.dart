// Clase del iterador
class NumberIterator implements Iterator<int> {
  List<int> _numbers;
  int _index = -1;

  NumberIterator(this._numbers);

@override
  bool moveNext() {
    _index++;
    return _index <= _numbers.length;
  }

@override
  int get current => _numbers[_index - 1];
}

// Clase iterable
class Numbers extends Iterable<int> {
  List<int> _numbers;

  Numbers(this._numbers);

  @override
  Iterator<int> get iterator => NumberIterator(_numbers);
}

void main() {
  var numbers = Numbers([1, 2, 3, 4, 5]);

  // Usando un bucle for-in para iterar sobre el iterable
  for (var number in numbers) {
    print(number);
  }
}