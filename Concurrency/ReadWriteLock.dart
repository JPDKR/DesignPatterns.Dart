import 'dart:async';

class ReadWriteLock {
  int _readers = 0;
  Completer<void>? _writerCompleter;

  Future<void> enterReadLock() async {
    while (_writerCompleter != null) {
      await _writerCompleter!.future;
    }
    _readers++;
  }

  void exitReadLock() {
    _readers--;
  }

  Future<void> enterWriteLock() async {
    while (_readers > 0 || _writerCompleter != null) {
      await Future.delayed(Duration(milliseconds: 10));
    }
    _writerCompleter = Completer<void>();
  }

  void exitWriteLock() {
    _writerCompleter?.complete();
    _writerCompleter = null;
  }
}

class ReadWriteLockExample {
  final ReadWriteLock _lock = ReadWriteLock();
  final List<int> _items = [];

  Future<void> addItem(int item) async {
    await _lock.enterWriteLock();
    try {
      _items.add(item);
      print('Item $item added.');
    } finally {
      _lock.exitWriteLock();
    }
  }

  Future<void> readItems() async {
    await _lock.enterReadLock();
    try {
      for (var item in _items) {
        print('Read item: $item');
      }
    } finally {
      _lock.exitReadLock();
    }
  }
}

void main() async {
  var example = ReadWriteLockExample();

  // Ejecutar tareas en paralelo
  await Future.wait([
    example.addItem(1),
    example.readItems(),
  ]);

  // Dar tiempo para que las tareas completen (en un entorno real, se gestionaría de manera diferente)
  await Future.delayed(Duration(seconds: 1));
}
