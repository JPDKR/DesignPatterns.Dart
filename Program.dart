import 'dart:io';
import 'Behavioral/ChainOfResponsabilities.dart' as ChainOfResponsabilities;
import 'Creational/AbstractFactory.dart' as AbstractFactory;
import 'Other/Architectural/MVC.dart' as MVC;
// import 'Other/Architectural/MVVM.dart' as MVVM;
import 'Other/Architectural/ServiceOrientedArchitecture.dart' as SOA;
import 'Other/Concurrency/ProducerConsumer.dart' as ProducerConsumer;
import 'Other/Domain/Repository.dart' as Repository;
import 'Structural/Adapter.dart' as Adapter;

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
        StructuralBridgeProgram().main();
        break;
      case 3:
        StructuralCompositeProgram().main();
        break;
      case 4:
        StructuralDecoratorProgram().main();
        break;
      case 5:
        StructuralFacadeProgram().main();
        break;
      case 6:
        StructuralFlyweightProgram().main();
        break;
      case 7:
        StructuralProxyProgram().main();
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
        CreationalBuilderProgram().main();
        break;
      case 3:
        CreationalFactoryMethodProgram().main();
        break;
      case 4:
        CreationalPrototypeProgram().main();
        break;
      case 5:
        CreationalSingletonNonThreadSafeProgram().main();
        break;
      case 6:
        CreationalSingletonThreadSafeProgram().main();
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
        BehavioralCommandProgram().main();
        break;
      case 3:
        BehavioralInterpreterProgram().main();
        break;
      case 4:
        BehavioralIteratorProgram().main();
        break;
      case 5:
        BehavioralMediatorProgram().main();
        break;
      case 6:
        BehavioralMementoProgram().main();
        break;
      case 7:
        BehavioralObserverProgram().main();
        break;
      case 8:
        BehavioralStateProgram().main();
        break;
      case 9:
        BehavioralStrategyProgram().main();
        break;
      case 10:
        BehavioralTemplateMethodProgram().main();
        break;
      case 11:
        BehavioralVisitorProgram().main();
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
        OtherConcurrencyReadWriteLockProgram().main();
        break;
      case 3:
        OtherConcurrencyThreadPoolProgram().main();
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
        OtherDomainUnitOfWorkProgram().main();
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