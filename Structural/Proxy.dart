// La interfaz Subject declara operaciones comunes para RealSubject y el Proxy.
// Mientras el cliente trabaje con RealSubject usando esta interfaz, podrás
// pasarle un proxy en lugar de un sujeto real.
abstract class ISubject {
  void request();
}

// RealSubject contiene algo de la lógica de negocio central.
// Generalmente, RealSubjects son capaces de hacer algún trabajo útil que
// puede ser muy lento o sensible - por ejemplo, corregir datos de entrada.
// Un Proxy puede resolver estos problemas sin ningún cambio en el código de RealSubject.
class RealSubject implements ISubject {
  @override
  void request() {
    print("RealSubject: Handling Request.");
  }
}

// El Proxy tiene una interfaz idéntica a RealSubject.
class Proxy implements ISubject {
  final RealSubject _realSubject;

  Proxy(this._realSubject);

  // Las aplicaciones más comunes del patrón Proxy son la carga diferida,
  // almacenamiento en caché, control de acceso, registro, etc.
  // Un Proxy puede realizar una de estas tareas y luego, dependiendo del resultado,
  // pasar la ejecución al mismo método en un objeto RealSubject vinculado.
  @override
  void request() {
    if (checkAccess()) {
      _realSubject.request();
      logAccess();
    }
  }

  bool checkAccess() {
    // Aquí deberían ir algunas verificaciones reales.
    print("Proxy: Checking access prior to firing a real request.");
    return true;
  }

  void logAccess() {
    print("Proxy: Logging the time of request.");
  }
}

// El código del cliente se supone que debe trabajar con todos los objetos (tanto sujetos
// como proxies) a través de la interfaz Subject para soportar tanto los sujetos reales
// como los proxies. En la vida real, sin embargo, los clientes generalmente trabajan
// con sus sujetos reales directamente. En este caso, para implementar el patrón
// más fácilmente, puedes extender tu proxy desde la clase del sujeto real.
class Client {
  void clientCode(ISubject subject) {
    // ...
    subject.request();
    // ...
  }
}

void main() {
  Client client = Client();

  print("Client: Executing the client code with a real subject:");
  RealSubject realSubject = RealSubject();
  client.clientCode(realSubject);

  print("");

  print("Client: Executing the same client code with a proxy:");
  Proxy proxy = Proxy(realSubject);
  client.clientCode(proxy);
}
