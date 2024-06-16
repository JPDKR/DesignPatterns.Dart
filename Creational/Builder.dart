// Se importa 'dart:core' para usar List y otras clases base.
import 'dart:core';

// Interfaz del Builder que especifica los métodos para construir las diferentes partes del objeto Producto.
abstract class IBuilder {
  void buildPartA();
  void buildPartB();
  void buildPartC();
}

// Clase ConcreteBuilder que implementa la interfaz IBuilder y proporciona implementaciones específicas de los pasos de construcción.
class ConcreteBuilder implements IBuilder {
  Product _product = Product();

  // Un constructor de ConcreteBuilder debería inicializar el producto.
  ConcreteBuilder() {
    reset();
  }

  // Método para reiniciar el producto a un estado inicial.
  void reset() {
    _product = Product();
  }

  @override
  void buildPartA() {
    _product.add('PartA1');
  }

  @override
  void buildPartB() {
    _product.add('PartB1');
  }

  @override
  void buildPartC() {
    _product.add('PartC1');
  }

  // Método para obtener el producto construido y reiniciar el builder para otro producto.
  Product getProduct() {
    Product result = _product;
    reset();
    return result;
  }
}

// Clase Product que representa el producto final con sus partes.
class Product {
  List<String> _parts = [];

  void add(String part) {
    _parts.add(part);
  }

  String listParts() {
    return 'Product parts: ${_parts.join(", ")}\n';
  }
}

// Clase Director que coordina el proceso de construcción del producto usando un Builder.
class Director {
  IBuilder _builder;

  Director(this._builder);

  // Método para construir un producto mínimo viable.
  void buildMinimalViableProduct() {
    _builder.buildPartA();
  }

  // Método para construir un producto completamente funcional.
  void buildFullFeaturedProduct() {
    _builder.buildPartA();
    _builder.buildPartB();
    _builder.buildPartC();
  }
}

void main() {
  // El código cliente crea un objeto builder, lo pasa al director y luego inicia el proceso de construcción.
  var builder = ConcreteBuilder();
  var director = Director(builder);

  print('Standard basic product:');
  director.buildMinimalViableProduct();
  print(builder.getProduct().listParts());

  print('Standard full featured product:');
  director.buildFullFeaturedProduct();
  print(builder.getProduct().listParts());

  // El patrón Builder también puede usarse sin una clase Director.
  print('Custom product:');
  builder.buildPartA();
  builder.buildPartC();
  print(builder.getProduct().listParts());
}
