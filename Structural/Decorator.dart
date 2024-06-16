// La interfaz base Component define operaciones que pueden ser alteradas por los decoradores.
abstract class Component {
  String operation();
}

// Los Concrete Components proporcionan implementaciones predeterminadas de las operaciones.
// Puede haber varias variaciones de estas clases.
class ConcreteComponent implements Component {
  @override
  String operation() {
    return "ConcreteComponent";
  }
}

// La clase base Decorator sigue la misma interfaz que los otros componentes.
// El propósito principal de esta clase es definir la interfaz de envoltura para todos los decoradores concretos.
// La implementación predeterminada del código de envoltura puede incluir un campo para almacenar un componente envuelto y los medios para inicializarlo.
abstract class Decorator implements Component {
  late Component _component;

  Decorator(this._component);

  void setComponent(Component component) {
    this._component = component;
  }

  // El Decorator delega todo el trabajo al componente envuelto.
  @override
  String operation() {
    return _component.operation();
  }
}

// Los Concrete Decorators llaman al objeto envuelto y alteran su resultado de alguna manera.
class ConcreteDecoratorA extends Decorator {
  ConcreteDecoratorA(Component comp) : super(comp);

  // Los decoradores pueden llamar a la implementación del padre de la operación,
  // en lugar de llamar directamente al objeto envuelto.
  // Este enfoque simplifica la extensión de las clases de decoradores.
  @override
  String operation() {
    return "ConcreteDecoratorA(${super.operation()})";
  }
}

// Los decoradores pueden ejecutar su comportamiento antes o después de la llamada al objeto envuelto.
class ConcreteDecoratorB extends Decorator {
  ConcreteDecoratorB(Component comp) : super(comp);

  @override
  String operation() {
    return "ConcreteDecoratorB(${super.operation()})";
  }
}

class Client {
  // El código del cliente trabaja con todos los objetos usando la interfaz Component.
  // De esta manera, puede mantenerse independiente de las clases concretas de componentes con las que trabaja.
  void clientCode(Component component) {
    print("RESULT: ${component.operation()}");
  }
}

void main() {
  Client client = Client();

  var simple = ConcreteComponent();
  print("Client: I get a simple component:");
  client.clientCode(simple);
  print("");

  // ...así como los decorados.
  //
  // Nota cómo los decoradores pueden envolver no solo componentes simples sino también otros decoradores.
  ConcreteDecoratorA decorator1 = ConcreteDecoratorA(simple);
  ConcreteDecoratorB decorator2 = ConcreteDecoratorB(decorator1);
  print("Client: Now I've got a decorated component:");
  client.clientCode(decorator2);
}
