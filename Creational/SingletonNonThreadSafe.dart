// Clase Singleton que implementa el patrón Singleton de manera no segura para subprocesos.
class SingletonNonThreadSafe {
  // Instancia única del Singleton, inicializada de manera perezosa.
  static SingletonNonThreadSafe? _instance;

  // Constructor privado para evitar la creación de instancias fuera de la clase.
  SingletonNonThreadSafe._();

  // Método estático que devuelve la única instancia del Singleton.
  static SingletonNonThreadSafe getInstance() {
    // Si _instance es nulo, se crea una nueva instancia.
    _instance ??= SingletonNonThreadSafe._();
    return _instance!;
  }

  // Método de lógica de negocio del Singleton (dummy en este ejemplo).
  void someBusinessLogic() {
    // Implementación de la lógica de negocio del Singleton.
  }
}

// Función principal del programa.
void main() {
  // Cliente: ejemplo de uso del Singleton.
  var s1 = SingletonNonThreadSafe.getInstance();
  var s2 = SingletonNonThreadSafe.getInstance();

  // Verificación de igualdad de instancias.
  if (identical(s1, s2)) {
    print("Singleton works, both variables contain the same instance.");
  } else {
    print("Singleton failed, variables contain different instances.");
  }
}
