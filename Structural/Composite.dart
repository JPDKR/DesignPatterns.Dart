// La clase base Component declara operaciones comunes tanto para objetos simples como complejos de una composición.
abstract class Component {
  // El componente base puede implementar algún comportamiento predeterminado o dejarlo a las clases concretas
  // (declarando el método que contiene el comportamiento como "abstracto").
  String operation();

  // En algunos casos, sería beneficioso definir las operaciones de gestión de hijos directamente en la clase base Component.
  // De esta manera, no necesitarás exponer ninguna clase de componente concreto al código del cliente, incluso durante el ensamblaje del árbol de objetos.
  // La desventaja es que estos métodos estarán vacíos para los componentes de nivel hoja.
  void add(Component component) {
    throw UnimplementedError();
  }

  void remove(Component component) {
    throw UnimplementedError();
  }

  // Puedes proporcionar un método que permita al código del cliente averiguar si un componente puede tener hijos.
  bool isComposite() {
    return true;
  }
}

// La clase Leaf representa los objetos finales de una composición. Una hoja no puede tener hijos.
// Por lo general, son los objetos Leaf los que realizan el trabajo real, mientras que los objetos Composite solo delegan a sus subcomponentes.
class Leaf extends Component {
  @override
  String operation() {
    return 'Leaf';
  }

  @override
  bool isComposite() {
    return false;
  }
}

// La clase Composite representa los componentes complejos que pueden tener hijos.
// Por lo general, los objetos Composite delegan el trabajo real a sus hijos y luego "suman" el resultado.
class Composite extends Component {
  final List<Component> _children = [];

  @override
  void add(Component component) {
    _children.add(component);
  }

  @override
  void remove(Component component) {
    _children.remove(component);
  }

  // El Composite ejecuta su lógica principal de una manera particular.
  // Recorre recursivamente todos sus hijos, recopilando y sumando sus resultados.
  // Dado que los hijos del composite pasan estas llamadas a sus hijos, y así sucesivamente, todo el árbol de objetos se recorre como resultado.
  @override
  String operation() {
    String result = 'Branch(';
    for (int i = 0; i < _children.length; i++) {
      result += _children[i].operation();
      if (i != _children.length - 1) {
        result += '+';
      }
    }
    return result + ')';
  }
}

class Client {
  // El código del cliente trabaja con todos los componentes a través de la interfaz base.
  void clientCode(Component component) {
    print('RESULT: ${component.operation()}\n');
  }

  // Gracias al hecho de que las operaciones de gestión de hijos están declaradas en la clase base Component,
  // el código del cliente puede trabajar con cualquier componente, simple o complejo, sin depender de sus clases concretas.
  void clientCode2(Component component1, Component component2) {
    if (component1.isComposite()) {
      component1.add(component2);
    }
    print('RESULT: ${component1.operation()}');
  }
}

void main() {
  Client client = Client();

  // De esta manera, el código del cliente puede admitir los componentes de hoja simples...
  Leaf leaf = Leaf();
  print('Client: I get a simple component:');
  client.clientCode(leaf);

  // ...así como los composites complejos.
  Composite tree = Composite();
  Composite branch1 = Composite();
  branch1.add(Leaf());
  branch1.add(Leaf());
  Composite branch2 = Composite();
  branch2.add(Leaf());
  tree.add(branch1);
  tree.add(branch2);
  print('Client: Now I\'ve got a composite tree:');
  client.clientCode(tree);

  print('Client: I don\'t need to check the components classes even when managing the tree:');
  client.clientCode2(tree, leaf);
}
