// La Abstracción define la interfaz para la parte "controladora" de las dos jerarquías de clases.
// Mantiene una referencia a un objeto de la jerarquía de Implementación y delega todo el trabajo real a este objeto.
class Abstraction {
  late IImplementation _implementation;

  Abstraction(this._implementation);

  String operation() {
    return "Abstract: Base operation with:\n" +
        _implementation.operationImplementation();
  }
}

// Puedes extender la Abstracción sin cambiar las clases de Implementación.
class ExtendedAbstraction extends Abstraction {
  ExtendedAbstraction(IImplementation implementation) : super(implementation);

  @override
  String operation() {
    return "ExtendedAbstraction: Extended operation with:\n" +
        _implementation.operationImplementation();
  }
}

// La Implementación define la interfaz para todas las clases de implementación.
// No tiene que coincidir con la interfaz de Abstracción. De hecho, las dos interfaces pueden ser completamente diferentes.
// Por lo general, la interfaz de Implementación proporciona solo operaciones primitivas, mientras que la Abstracción define operaciones de alto nivel basadas en esas primitivas.
abstract class IImplementation {
  String operationImplementation();
}

// Cada Implementación Concreta corresponde a una plataforma específica y 
// implementa la interfaz de Implementación utilizando la API de esa plataforma.
class ConcreteImplementationA implements IImplementation {
  @override
  String operationImplementation() {
    return "ConcreteImplementationA: The result in platform A.\n";
  }
}

class ConcreteImplementationB implements IImplementation {
  @override
  String operationImplementation() {
    return "ConcreteImplementationB: The result in platform B.\n";
  }
}

class Client {
  // Excepto por la fase de inicialización, donde un objeto de Abstracción se enlaza con un objeto de Implementación específico,
  // el código del cliente solo debe depender de la clase de Abstracción. De esta manera, el código del cliente puede
  // admitir cualquier combinación de abstracción-implementación.
  void clientCode(Abstraction abstraction) {
    print(abstraction.operation());
  }
}

void main() {
  Client client = Client();

  Abstraction abstraction;

  // El código del cliente debería poder trabajar con cualquier combinación de abstracción-implementación preconfigurada.
  abstraction = Abstraction(ConcreteImplementationA());
  client.clientCode(abstraction);

  print('');

  abstraction = ExtendedAbstraction(ConcreteImplementationB());
  client.clientCode(abstraction);
}
