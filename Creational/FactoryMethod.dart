// Definición de la interfaz del Producto que declara la operación que todos los productos concretos deben implementar.
abstract class IProduct {
  String operation();
}

// Clase Creator abstracta que declara el método factoryMethod que debe ser implementado por sus subclases concretas.
abstract class Creator {
  // El método factoryMethod devuelve un objeto del tipo IProduct.
  IProduct factoryMethod();

  // La clase Creator también puede contener lógica de negocio que utiliza los productos retornados por factoryMethod.
  String someOperation() {
    // Llama a factoryMethod para crear un objeto Product.
    var product = factoryMethod();
    // Usa el producto.
    var result =
        'Creator: The same creator\'s code has just worked with ${product.operation()}';

    return result;
  }
}

// Clase ConcreteCreator1 que implementa el factoryMethod para devolver una instancia de ConcreteProduct1.
class ConcreteCreator1 extends Creator {
  @override
  IProduct factoryMethod() {
    return ConcreteProduct1();
  }
}

// Clase ConcreteCreator2 que implementa el factoryMethod para devolver una instancia de ConcreteProduct2.
class ConcreteCreator2 extends Creator {
  @override
  IProduct factoryMethod() {
    return ConcreteProduct2();
  }
}

// Clase ConcreteProduct1 que implementa la interfaz IProduct.
class ConcreteProduct1 implements IProduct {
  @override
  String operation() {
    return '{Result of ConcreteProduct1}';
  }
}

// Clase ConcreteProduct2 que implementa la interfaz IProduct.
class ConcreteProduct2 implements IProduct {
  @override
  String operation() {
    return '{Result of ConcreteProduct2}';
  }
}

// Clase Client que prueba el patrón Factory Method.
class Client {
  void main() {
    print('App: Launched with the ConcreteCreator1.');
    clientCode(ConcreteCreator1());

    print('');

    print('App: Launched with the ConcreteCreator2.');
    clientCode(ConcreteCreator2());
  }

  // Método que utiliza un Creator para realizar operaciones.
  void clientCode(Creator creator) {
    // Usa el Creator para obtener un producto y realizar operaciones con él.
    print('Client: I\'m not aware of the creator\'s class, '
        'but it still works.\n${creator.someOperation()}');
  }
}

// Punto de entrada del programa.
void main() {
  Client().main();
}
