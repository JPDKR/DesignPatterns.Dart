import 'dart:io';

// La clase Facade proporciona una interfaz simple para la lógica compleja de uno o varios subsistemas.
// La Facade delega las solicitudes del cliente a los objetos apropiados dentro del subsistema.
// La Facade también es responsable de gestionar su ciclo de vida.
// Todo esto protege al cliente de la complejidad no deseada del subsistema.
class Facade {
  final Subsystem1 _subsystem1;
  final Subsystem2 _subsystem2;

  Facade(this._subsystem1, this._subsystem2);

  // Los métodos de Facade son atajos convenientes a la funcionalidad sofisticada de los subsistemas.
  // Sin embargo, los clientes solo obtienen una fracción de las capacidades de un subsistema.
  String operation() {
    String result = "Facade initializes subsystems:\n";
    result += _subsystem1.operation1();
    result += _subsystem2.operation1();
    result += "Facade orders subsystems to perform the action:\n";
    result += _subsystem1.operationN();
    result += _subsystem2.operationZ();
    return result;
  }
}

// El Subsistema puede aceptar solicitudes del facade o del cliente directamente.
// En cualquier caso, para el Subsistema, el Facade es solo otro cliente y no es parte del Subsistema.
class Subsystem1 {
  String operation1() {
    return "Subsystem1: Ready!\n";
  }

  String operationN() {
    return "Subsystem1: Go!\n";
  }
}

// Algunas facades pueden trabajar con múltiples subsistemas al mismo tiempo.
class Subsystem2 {
  String operation1() {
    return "Subsystem2: Get ready!\n";
  }

  String operationZ() {
    return "Subsystem2: Fire!\n";
  }
}

class Client {
  // El código del cliente trabaja con subsistemas complejos a través de una interfaz simple proporcionada por la Facade.
  // Cuando una Facade gestiona el ciclo de vida del subsistema, el cliente puede no saber ni siquiera de la existencia del subsistema.
  // Este enfoque permite mantener la complejidad bajo control.
  static void clientCode(Facade facade) {
    stdout.write(facade.operation());
  }
}

void main() {
  // El código del cliente puede tener algunos de los objetos del subsistema ya creados.
  // En este caso, puede ser útil inicializar la Facade con estos objetos en lugar de permitir que la Facade cree nuevas instancias.
  Subsystem1 subsystem1 = Subsystem1();
  Subsystem2 subsystem2 = Subsystem2();
  Facade facade = Facade(subsystem1, subsystem2);
  Client.clientCode(facade);
}
