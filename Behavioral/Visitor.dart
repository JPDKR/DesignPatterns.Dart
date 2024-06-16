import 'dart:core';

// The Component interface declares an `accept` method that should take the
// base visitor interface as an argument.
abstract class IComponent {
  void accept(IVisitor visitor);
}

// Each Concrete Component must implement the `Accept` method in such a way
// that it calls the visitor's method corresponding to the component's
// class.
class ConcreteComponentA implements IComponent {
  // Note that we're calling `visitConcreteComponentA`, which matches the
  // current class name. This way we let the visitor know the class of the
  // component it works with.
  @override
  void accept(IVisitor visitor) {
    visitor.visitConcreteComponentA(this);
  }

  // Concrete Components may have special methods that don't exist in
  // their base class or interface. The Visitor is still able to use these
  // methods since it's aware of the component's concrete class.
  String exclusiveMethodOfConcreteComponentA() {
    return "A";
  }
}

class ConcreteComponentB implements IComponent {
  // Same here: visitConcreteComponentB => ConcreteComponentB
  @override
  void accept(IVisitor visitor) {
    visitor.visitConcreteComponentB(this);
  }

  String specialMethodOfConcreteComponentB() {
    return "B";
  }
}

// The Visitor Interface declares a set of visiting methods that correspond
// to component classes. The signature of a visiting method allows the
// visitor to identify the exact class of the component that it's dealing
// with.
abstract class IVisitor {
  void visitConcreteComponentA(ConcreteComponentA element);
  void visitConcreteComponentB(ConcreteComponentB element);
}

// Concrete Visitors implement several versions of the same algorithm, which
// can work with all concrete component classes.
//
// You can experience the biggest benefit of the Visitor pattern when using
// it with a complex object structure, such as a Composite tree. In this
// case, it might be helpful to store some intermediate state of the
// algorithm while executing visitor's methods over various objects of the
// structure.
class ConcreteVisitor1 implements IVisitor {
  @override
  void visitConcreteComponentA(ConcreteComponentA element) {
    print('${element.exclusiveMethodOfConcreteComponentA()} + ConcreteVisitor1');
  }

  @override
  void visitConcreteComponentB(ConcreteComponentB element) {
    print('${element.specialMethodOfConcreteComponentB()} + ConcreteVisitor1');
  }
}

class ConcreteVisitor2 implements IVisitor {
  @override
  void visitConcreteComponentA(ConcreteComponentA element) {
    print('${element.exclusiveMethodOfConcreteComponentA()} + ConcreteVisitor2');
  }

  @override
  void visitConcreteComponentB(ConcreteComponentB element) {
    print('${element.specialMethodOfConcreteComponentB()} + ConcreteVisitor2');
  }
}

class Client {
  // The client code can run visitor operations over any set of elements
  // without figuring out their concrete classes. The accept operation
  // directs a call to the appropriate operation in the visitor object.
  static void clientCode(List<IComponent> components, IVisitor visitor) {
    for (var component in components) {
      component.accept(visitor);
    }
  }
}

void main() {
  List<IComponent> components = [
    ConcreteComponentA(),
    ConcreteComponentB()
  ];

  print("The client code works with all visitors via the base Visitor interface:");
  var visitor1 = ConcreteVisitor1();
  Client.clientCode(components, visitor1);

  print("\nIt allows the same client code to work with different types of visitors:");
  var visitor2 = ConcreteVisitor2();
  Client.clientCode(components, visitor2);
}


