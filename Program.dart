import 'dart:io';
import 'Behavioral/ChainOfResponsabilities.dart' as ChainOfResponsabilities;
import 'Behavioral/Command.dart' as Command;
import 'Behavioral/Interpreter.dart' as Interpreter;
import 'Behavioral/Iterator.dart' as Iterator;
import 'Behavioral/Mediator.dart' as Mediator;
import 'Behavioral/Memento.dart' as Memento;
import 'Behavioral/Observer.dart' as Observer;
import 'Behavioral/State.dart' as State;
import 'Behavioral/Strategy.dart' as Strategy;
import 'Behavioral/TemplateMethod.dart' as TemplateMethod;
import 'Behavioral/Visitor.dart' as Visitor;
import 'Creational/AbstractFactory.dart' as AbstractFactory;
import 'Creational/Builder.dart' as Builder;
import 'Creational/FactoryMethod.dart' as FactoryMethod;
import 'Creational/Prototype.dart' as Prototype;
import 'Creational/SingletonNonThreadSafe.dart' as SingletonNonThreadSafe;
import 'Creational/SingletonThreadSafe.dart' as SingletonThreadSafe;
import 'Other/Architectural/MVC.dart' as MVC;
//import 'Other/Architectural/Microservices.dart' as Microservices;
// import 'Other/Architectural/MVVM.dart' as MVVM;
import 'Other/Architectural/ServiceOrientedArchitecture.dart' as SOA;
import 'Other/Concurrency/ProducerConsumer.dart' as ProducerConsumer;
import 'Other/Concurrency/ReadWriteLock.dart' as ReadWriteLock;
import 'Other/Concurrency/ThreadPool.dart' as ThreadPool;
import 'Other/Domain/Repository.dart' as Repository;
import 'Other/Domain/UnitOfWork.dart' as UnitOfWork;
import 'Structural/Adapter.dart' as Adapter;
import 'Structural/Bridge.dart' as Bridge;
import 'Structural/Composite.dart' as Composite;
import 'Structural/Decorator.dart' as Decorator;
import 'Structural/Facade.dart' as Facade;
import 'Structural/Flyweight.dart' as Flyweight;
import 'Structural/Proxy.dart' as Proxy;

main() {
  print("Ingrese su tipo de patrón.\n1. Estructural.\n2. Creacional.\n3. Comportamiento");

  int? opcion = int.tryParse(stdin.readLineSync() ?? '');

  if (opcion != null) {
    stdout.write('\x1B[2J\x1B[0;0H'); // Clear console

    switch (opcion) {
      case 1:
        mostrarMenuEstructural();
        break;
      case 2:
        mostrarMenuCreacional();
        break;
      case 3:
        mostrarMenuComportamiento();
        break;
      case 66:
        masPatrones();
        break;
      default:
        print("Opción no válida.");
        break;
    }
  }
}

mostrarMenuEstructural() {
  print("Eligió Patrones Estructurales.");
  print("Seleccione su patrón");
  print("1. Adapter.\n2. Bridge.\n3. Composite.\n4. Decorator.\n5. Facade.\n6. Flyweight.\n7. Proxy");

  int? opcion = int.tryParse(stdin.readLineSync() ?? '');

  if (opcion != null) {
    stdout.write('\x1B[2J\x1B[0;0H'); // Clear console

    switch (opcion) {
      case 1:
        Adapter.main();
        break;
      case 2:
        Bridge.main();
        break;
      case 3:
        Composite.main();
        break;
      case 4:
        Decorator.main();
        break;
      case 5:
        Facade.main();
        break;
      case 6:
        Flyweight.main();
        break;
      case 7:
        Proxy.main();
        break;
      default:
        print("Opción no válida.");
        break;
    }
  }
}

void mostrarMenuCreacional() {
  print("Eligió Patrones Creacionales.");
  print("Seleccione su patrón");
  print("1. Abstract Factory.\n2. Builder.\n3. Factory Method.\n4. Prototype.\n5. Singleton (Non-Thread Safe).\n6. Singleton (Thread Safe)");

  int? opcion = int.tryParse(stdin.readLineSync() ?? '');

  if (opcion != null) {
    stdout.write('\x1B[2J\x1B[0;0H'); // Clear console

    switch (opcion) {
      case 1:
        AbstractFactory.main();
        break;
      case 2:
        Builder.main();
        break;
      case 3:
        FactoryMethod.main();
        break;
      case 4:
        Prototype.main();
        break;
      case 5:
        SingletonNonThreadSafe.main();
        break;
      case 6:
        SingletonThreadSafe.main();
        break;
      default:
        print("Opción no válida.");
        break;
    }
  }
}

void mostrarMenuComportamiento() {
  print("Eligió Patrones de Comportamiento.");
  print("Seleccione su patrón");
  print("1. Chain Of Responsibility.\n2. Command.\n3. Interpreter.\n4. Iterator.\n5. Mediator.\n6. Memento.\n7. Observer.\n8. State.\n9. Strategy.\n10. Template Method.\n11. Visitor.");

  int? opcion = int.tryParse(stdin.readLineSync() ?? '');

  if (opcion != null) {
    stdout.write('\x1B[2J\x1B[0;0H'); // Clear console

    switch (opcion) {
      case 1:
      ChainOfResponsabilities.main();
        break;
      case 2:
        Command.main();
        break;
      case 3:
        Interpreter.main();
        break;
      case 4:
        Iterator.main();
        break;
      case 5:
        Mediator.main();
        break;
      case 6:
        Memento.main();
        break;
      case 7:
        Observer.main();
        break;
      case 8:
        State.main();
        break;
      case 9:
        Strategy.main();
        break;
      case 10:
        TemplateMethod.main();
        break;
      case 11:
        Visitor.main();
        break;
      default:
        print("Opción no válida.");
        break;
    }
  }
}

void masPatrones() {
  print("Patrones de Concurrencia:\n\n"
      "1. Producer-Consumer\n"
      "2. Read-Write Lock\n"
      "3. Thread Pool\n\n"
      "Patrones Arquitectónicos:\n\n"
      "4. MVC (Model-View-Controller)\n"
      "5. MVVM (Model-View-ViewModel)\n"
      "6. Microservicios\n"
      "7. Service-Oriented Architecture (SOA)\n\n"
      "Patrones Específicos de Dominios:\n\n"
      "8. Repository\n"
      "9. Unit of Work\n"
      "10. Domain Model");

  int? opcion = int.tryParse(stdin.readLineSync() ?? '');

  if (opcion != null) {
    stdout.write('\x1B[2J\x1B[0;0H'); // Clear console

    switch (opcion) {
      case 1:
        ProducerConsumer.main();
        break;
      case 2:
        ReadWriteLock.main();
        break;
      case 3:
        ThreadPool.main();
        break;
      case 4:
        MVC.main();
        break;
      case 5:
        // MVVM - Solo en WPF.
        break;
      case 6:
        // Microservicios - Solo con AspNet
        break;
      case 7:
        SOA.main();
        break;
      case 8:
        Repository.main();
        break;
      case 9:
        UnitOfWork.main();
        break;
      case 10:
        // Domain Model - Es solo muestra.
        break;
      default:
        print("Opción no válida.");
        break;
    }
  }
}