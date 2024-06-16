import 'dart:core';

// Clase Person que implementa el patrón Prototype.
class Person {
  int age;
  DateTime? birthDate;
  String? name;
  IdInfo? idInfo;

  // Constructor de copia superficial.
  Person shallowCopy() {
    return Person()
      ..age = age
      ..birthDate = birthDate
      ..name = name
      ..idInfo = idInfo; // Copia superficial de IdInfo
  }

  // Constructor de copia profunda.
  Person deepCopy() {
    return Person()
      ..age = age
      ..birthDate = birthDate
      ..name = name != null ? name!.toString() : null
      ..idInfo = idInfo != null ? IdInfo(idInfo!.idNumber) : null; // Copia profunda de IdInfo
  }

  // Constructor de la clase Person.
  Person({
    this.age = 0,
    this.birthDate,
    this.name,
    this.idInfo,
  });
}

// Clase IdInfo utilizada por Person.
class IdInfo {
  int idNumber;

  IdInfo(this.idNumber);
}

// Función principal del programa.
void main() {
  // Creación de un objeto Person inicial.
  var p1 = Person(
    age: 42,
    birthDate: DateTime.parse("1977-01-01"),
    name: "Jack Daniels",
    idInfo: IdInfo(666),
  );

  // Realizar una copia superficial de p1 y asignarla a p2.
  var p2 = p1.shallowCopy();

  // Realizar una copia profunda de p1 y asignarla a p3.
  var p3 = p1.deepCopy();

  // Mostrar los valores de p1, p2 y p3.
  print("Original values of p1, p2, p3:");
  print("   p1 instance values:");
  displayValues(p1);
  print("   p2 instance values:");
  displayValues(p2);
  print("   p3 instance values:");
  displayValues(p3);

  // Cambiar los valores de las propiedades de p1 y mostrar los valores de p1, p2 y p3.
  p1.age = 32;
  p1.birthDate = DateTime.parse("1900-01-01");
  p1.name = "Frank";
  p1.idInfo!.idNumber = 7878;
  print("\nValues of p1, p2 and p3 after changes to p1:");
  print("   p1 instance values:");
  displayValues(p1);
  print("   p2 instance values (reference values have changed):");
  displayValues(p2);
  print("   p3 instance values (everything was kept the same):");
  displayValues(p3);
}

// Función para mostrar los valores de una instancia de Person.
void displayValues(Person p) {
  print("      Name: ${p.name}, Age: ${p.age}, BirthDate: ${p.birthDate.toString().substring(0, 10)}");
  print("      ID#: ${p.idInfo?.idNumber}");
}
