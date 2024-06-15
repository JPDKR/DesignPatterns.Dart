// The Handler interface declares a method for building the chain of
// handlers. It also declares a method for executing a request.

abstract class Handler {
  Handler setNext(Handler handler);
  String? handle(String request);
}

// The default chaining behavior can be implemented inside a base handler
// class.
abstract class AbstractHandler implements Handler {
  Handler? _nextHandler;

  @override
  Handler setNext(Handler handler) {
    _nextHandler = handler;
    return handler;
  }

  @override
  String? handle(String request) {
    if (_nextHandler != null) {
      return _nextHandler!.handle(request);
    } else {
      return null;
    }
  }
}

class MonkeyHandler extends AbstractHandler {
  @override
  String? handle(String request) {
    if (request == "Banana") {
      return "Monkey: I'll eat the $request.\n";
    } else {
      return super.handle(request);
    }
  }
}

class SquirrelHandler extends AbstractHandler {
  @override
  String? handle(String request) {
    if (request == "Nut") {
      return "Squirrel: I'll eat the $request.\n";
    } else {
      return super.handle(request);
    }
  }
}

class DogHandler extends AbstractHandler {
  @override
  String? handle(String request) {
    if (request == "MeatBall") {
      return "Dog: I'll eat the $request.\n";
    } else {
      return super.handle(request);
    }
  }
}

class Client {
  // The client code is usually suited to work with a single handler. In
  // most cases, it is not even aware that the handler is part of a chain.
  static void clientCode(AbstractHandler handler) {
    for (var food in ["Nut", "Banana", "Cup of coffee"]) {
      print("Client: Who wants a $food?");

      var result = handler.handle(food);

      if (result != null) {
        print("   $result");
      } else {
        print("   $food was left untouched.");
      }
    }
  }
}

void main() {
  // The other part of the client code constructs the actual chain.
  var monkey = MonkeyHandler();
  var squirrel = SquirrelHandler();
  var dog = DogHandler();

  monkey.setNext(squirrel).setNext(dog);

  // The client should be able to send a request to any handler, not
  // just the first one in the chain.
  print("Chain: Monkey > Squirrel > Dog\n");
  Client.clientCode(monkey);
  print("");

  print("Subchain: Squirrel > Dog\n");
  Client.clientCode(squirrel);
}