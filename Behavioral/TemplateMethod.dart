// The Abstract Class defines a template method that contains a skeleton of
// some algorithm, composed of calls to (usually) abstract primitive
// operations.
//
// Concrete subclasses should implement these operations, but leave the
// template method itself intact.
abstract class AbstractClass {
  // The template method defines the skeleton of an algorithm.
  void templateMethod() {
    baseOperation1();
    requiredOperations1();
    baseOperation2();
    hook1();
    requiredOperation2();
    baseOperation3();
    hook2();
  }

  // These operations already have implementations.
  void baseOperation1() {
    print("AbstractClass says: I am doing the bulk of the work");
  }

  void baseOperation2() {
    print("AbstractClass says: But I let subclasses override some operations");
  }

  void baseOperation3() {
    print("AbstractClass says: But I am doing the bulk of the work anyway");
  }

  // These operations have to be implemented in subclasses.
  void requiredOperations1();

  void requiredOperation2();

  // These are "hooks." Subclasses may override them, but it's not
  // mandatory since the hooks already have default (but empty)
  // implementation. Hooks provide additional extension points in some
  // crucial places of the algorithm.
  void hook1() {}

  void hook2() {}
}

// Concrete classes have to implement all abstract operations of the base
// class. They can also override some operations with a default
// implementation.
class ConcreteClass1 extends AbstractClass {
  @override
  void requiredOperations1() {
    print("ConcreteClass1 says: Implemented Operation1");
  }

  @override
  void requiredOperation2() {
    print("ConcreteClass1 says: Implemented Operation2");
  }
}

// Usually, concrete classes override only a fraction of base class'
// operations.
class ConcreteClass2 extends AbstractClass {
  @override
  void requiredOperations1() {
    print("ConcreteClass2 says: Implemented Operation1");
  }

  @override
  void requiredOperation2() {
    print("ConcreteClass2 says: Implemented Operation2");
  }

  @override
  void hook1() {
    print("ConcreteClass2 says: Overridden Hook1");
  }
}

class Client {
  // The client code calls the template method to execute the algorithm.
  // Client code does not have to know the concrete class of an object it
  // works with, as long as it works with objects through the interface of
  // their base class.
  static void clientCode(AbstractClass abstractClass) {
    // ...
    abstractClass.templateMethod();
    // ...
  }
}

void main() {
  print("Same client code can work with different subclasses:");

  Client.clientCode(ConcreteClass1());

  print("\n");

  print("Same client code can work with different subclasses:");
  Client.clientCode(ConcreteClass2());
}


