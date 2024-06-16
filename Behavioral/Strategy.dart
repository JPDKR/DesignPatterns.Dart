import 'dart:core';
import 'dart:io';

// The Context defines the interface of interest to clients.
class Context {
  // The Context maintains a reference to one of the Strategy objects. The
  // Context does not know the concrete class of a strategy. It should
  // work with all strategies via the Strategy interface.
  IStrategy? _strategy;

  Context();

  // Usually, the Context accepts a strategy through the constructor, but
  // also provides a setter to change it at runtime.
  Context.withStrategy(this._strategy);

  // Usually, the Context allows replacing a Strategy object at runtime.
  void setStrategy(IStrategy strategy) {
    _strategy = strategy;
  }

  // The Context delegates some work to the Strategy object instead of
  // implementing multiple versions of the algorithm on its own.
  void doSomeBusinessLogic() {
    print("Context: Sorting data using the strategy (not sure how it'll do it)");
    var result = _strategy!.doAlgorithm(['a', 'b', 'c', 'd', 'e']);

    String resultStr = '';
    for (var element in result) {
      resultStr += '$element,';
    }

    print(resultStr);
  }
}

// The Strategy interface declares operations common to all supported
// versions of some algorithm.
//
// The Context uses this interface to call the algorithm defined by Concrete
// Strategies.
abstract class IStrategy {
  List<String> doAlgorithm(List<String> data);
}

// Concrete Strategies implement the algorithm while following the base
// Strategy interface. The interface makes them interchangeable in the
// Context.
class ConcreteStrategyA implements IStrategy {
  @override
  List<String> doAlgorithm(List<String> data) {
    data.sort();
    return data;
  }
}

class ConcreteStrategyB implements IStrategy {
  @override
  List<String> doAlgorithm(List<String> data) {
    data.sort();
    return data.reversed.toList();
  }
}

void main() {
  // The client code picks a concrete strategy and passes it to the
  // context. The client should be aware of the differences between
  // strategies in order to make the right choice.
  var context = Context();

  print("Client: Strategy is set to normal sorting.");
  context.setStrategy(ConcreteStrategyA());
  context.doSomeBusinessLogic();

  print("");

  print("Client: Strategy is set to reverse sorting.");
  context.setStrategy(ConcreteStrategyB());
  context.doSomeBusinessLogic();
}


