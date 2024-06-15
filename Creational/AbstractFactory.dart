// The Abstract Factory interface declares a set of methods that return
// different abstract products. These products are called a family and are
// related by a high-level theme or concept. Products of one family are
// usually able to collaborate among themselves. A family of products may
// have several variants, but the products of one variant are incompatible
// with products of another.
abstract class IAbstractFactory {
  IAbstractProductA createProductA();
  IAbstractProductB createProductB();
}

// Concrete Factories produce a family of products that belong to a single
// variant. The factory guarantees that resulting products are compatible.
// Note that signatures of the Concrete Factory's methods return an abstract
// product, while inside the method a concrete product is instantiated.
class ConcreteFactory1 implements IAbstractFactory {
  @override
  IAbstractProductA createProductA() {
    return ConcreteProductA1();
  }

  @override
  IAbstractProductB createProductB() {
    return ConcreteProductB1();
  }
}

// Each Concrete Factory has a corresponding product variant.
class ConcreteFactory2 implements IAbstractFactory {
  @override
  IAbstractProductA createProductA() {
    return ConcreteProductA2();
  }

  @override
  IAbstractProductB createProductB() {
    return ConcreteProductB2();
  }
}

// Each distinct product of a product family should have a base interface.
// All variants of the product must implement this interface.
abstract class IAbstractProductA {
  String usefulFunctionA();
}

// Concrete Products are created by corresponding Concrete Factories.
class ConcreteProductA1 implements IAbstractProductA {
  @override
  String usefulFunctionA() {
    return "The result of the product A1.";
  }
}

class ConcreteProductA2 implements IAbstractProductA {
  @override
  String usefulFunctionA() {
    return "The result of the product A2.";
  }
}

// Here's the base interface of another product. All products can
// interact with each other, but proper interaction is possible only between
// products of the same concrete variant.
abstract class IAbstractProductB {
  // Product B is able to do its own thing...
  String usefulFunctionB();

  // ...but it also can collaborate with the ProductA.
  //
  // The Abstract Factory makes sure that all products it creates are of
  // the same variant and thus, compatible.
  String anotherUsefulFunctionB(IAbstractProductA collaborator);
}

// Concrete Products are created by corresponding Concrete Factories.
class ConcreteProductB1 implements IAbstractProductB {
  @override
  String usefulFunctionB() {
    return "The result of the product B1.";
  }

  // The variant, Product B1, is only able to work correctly with the
  // variant, Product A1. Nevertheless, it accepts any instance of
  // AbstractProductA as an argument.
  @override
  String anotherUsefulFunctionB(IAbstractProductA collaborator) {
    var result = collaborator.usefulFunctionA();
    return "The result of the B1 collaborating with the ($result)";
  }
}

class ConcreteProductB2 implements IAbstractProductB {
  @override
  String usefulFunctionB() {
    return "The result of the product B2.";
  }

  // The variant, Product B2, is only able to work correctly with the
  // variant, Product A2. Nevertheless, it accepts any instance of
  // AbstractProductA as an argument.
  @override
  String anotherUsefulFunctionB(IAbstractProductA collaborator) {
    var result = collaborator.usefulFunctionA();
    return "The result of the B2 collaborating with the ($result)";
  }
}

// The client code works with factories and products only through abstract
// types: AbstractFactory and AbstractProduct. This lets you pass any
// factory or product subclass to the client code without breaking it.
class Client {
  void main() {
    // The client code can work with any concrete factory class.
    print("Client: Testing client code with the first factory type...");
    clientMethod(ConcreteFactory1());
    print("");

    print("Client: Testing the same client code with the second factory type...");
    clientMethod(ConcreteFactory2());
  }

  void clientMethod(IAbstractFactory factory) {
    var productA = factory.createProductA();
    var productB = factory.createProductB();

    print(productB.usefulFunctionB());
    print(productB.anotherUsefulFunctionB(productA));
  }
}

void main() {
  Client().main();
}


