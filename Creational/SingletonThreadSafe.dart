import 'dart:async';

class Singleton {
  static Singleton? _instance;
  static final Completer<Singleton> _completer = Completer<Singleton>();

  // Constructor privado
  Singleton._privateConstructor() {
    // Lógica de inicialización si es necesario
  }

  // Método estático para obtener la instancia del Singleton
  static Future<Singleton> getInstance() async {
    // Si _instance no es null, retorna la instancia existente
    if (_instance != null) {
      return _instance!;
    }

    // Si _instance es null, espera a que se complete la inicialización
    if (!_completer.isCompleted) {
      _instance = Singleton._privateConstructor();
      _completer.complete(_instance);
    }

    return _completer.future;
  }

  // Método de lógica de negocio del Singleton
  void someBusinessLogic() {
    // Implementación de la lógica de negocio del Singleton
    print('Singleton business logic executed.');
  }
}

void main() async {
  // Cliente: ejemplo de uso del Singleton ThreadSafe
  var s1 = await Singleton.getInstance();
  var s2 = await Singleton.getInstance();

  // Verificación de igualdad de instancias
  if (identical(s1, s2)) {
    print("Singleton works, both variables contain the same instance.");
  } else {
    print("Singleton failed, variables contain different instances.");
  }

  // Ejecutar lógica de negocio
  s1.someBusinessLogic();
}
