import 'dart:math';
import 'dart:async';

class Originator {
  // For the sake of simplicity, the originator's state is stored inside a
  // single variable.
  String _state;

  Originator(this._state) {
    print("Originator: My initial state is: $_state");
  }

  // The Originator's business logic may affect its internal state.
  // Therefore, the client should backup the state before launching
  // methods of the business logic via the save() method.
  void doSomething() {
    print("Originator: I'm doing something important.");
    _state = _generateRandomString(30);
    print("Originator: and my state has changed to: $_state");
  }

  String _generateRandomString(int length) {
    const allowedSymbols = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final random = Random();
    final result = StringBuffer();

    while (length > 0) {
      result.write(allowedSymbols[random.nextInt(allowedSymbols.length)]);
      length--;
    }

    return result.toString();
  }

  // Saves the current state inside a memento.
  IMemento save() {
    return ConcreteMemento(_state);
  }

  // Restores the Originator's state from a memento object.
  void restore(IMemento memento) {
    if (memento is! ConcreteMemento) {
      throw Exception("Unknown memento class ${memento.toString()}");
    }

    _state = memento.getState();
    print("Originator: My state has changed to: $_state");
  }
}

// The Memento interface provides a way to retrieve the memento's metadata,
// such as creation date or name. However, it doesn't expose the
// Originator's state.
abstract class IMemento {
  String getName();
  String getState();
  DateTime getDate();
}

// The Concrete Memento contains the infrastructure for storing the
// Originator's state.
class ConcreteMemento implements IMemento {
  final String _state;
  final DateTime _date;

  ConcreteMemento(this._state) : _date = DateTime.now();

  // The Originator uses this method when restoring its state.
  @override
  String getState() {
    return _state;
  }

  // The rest of the methods are used by the Caretaker to display
  // metadata.
  @override
  String getName() {
    return '$_date / (${_state.substring(0, 9)})...';
  }

  @override
  DateTime getDate() {
    return _date;
  }
}

// The Caretaker doesn't depend on the Concrete Memento class. Therefore, it
// doesn't have access to the originator's state, stored inside the memento.
// It works with all mementos via the base Memento interface.
class Caretaker {
  final List<IMemento> _mementos = [];
  final Originator _originator;

  Caretaker(this._originator);

  void backup() {
    print("\nCaretaker: Saving Originator's state...");
    _mementos.add(_originator.save());
  }

  void undo() {
    if (_mementos.isEmpty) {
      return;
    }

    final memento = _mementos.removeLast();
    print("Caretaker: Restoring state to: ${memento.getName()}");

    try {
      _originator.restore(memento);
    } catch (e) {
      undo();
    }
  }

  void showHistory() {
    print("Caretaker: Here's the list of mementos:");
    for (var memento in _mementos) {
      print(memento.getName());
    }
  }
}

void main() {
  // Client code.
  final originator = Originator("Super-duper-super-puper-super.");
  final caretaker = Caretaker(originator);

  caretaker.backup();
  originator.doSomething();

  caretaker.backup();
  originator.doSomething();

  caretaker.backup();
  originator.doSomething();

  print('');
  caretaker.showHistory();

  print("\nClient: Now, let's rollback!\n");
  caretaker.undo();

  print("\n\nClient: Once more!\n");
  caretaker.undo();

  print('');
}


