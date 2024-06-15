import 'dart:async';
import 'dart:collection';

class ProducerConsumer {
  final Queue<int> _buffer = Queue<int>();
  final int _bufferSize = 10;
  bool _isAddingCompleted = false;

  void start() {
    var producer = produce();
    var consumer = consume();

    Future.wait([producer, consumer]);
  }

  Future<void> produce() async {
    for (int i = 0; i < 20; i++) {
      while (_buffer.length >= _bufferSize) {
        await Future.delayed(Duration(milliseconds: 10));
      }
      _buffer.add(i);
      print('Produced $i');
      await Future.delayed(Duration(milliseconds: 100));
    }
    _isAddingCompleted = true;
  }

  Future<void> consume() async {
    while (!_isAddingCompleted || _buffer.isNotEmpty) {
      if (_buffer.isNotEmpty) {
        var item = _buffer.removeFirst();
        print('Consumed $item');
        await Future.delayed(Duration(milliseconds: 150));
      } else {
        await Future.delayed(Duration(milliseconds: 10));
      }
    }
  }
}

void main() {
  ProducerConsumer().start();
}


