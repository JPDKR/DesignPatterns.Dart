import 'dart:convert';

// La clase Flyweight almacena una porción común del estado (también llamado estado intrínseco) 
// que pertenece a múltiples entidades de negocios reales. Flyweight acepta el resto del estado 
// (estado extrínseco, único para cada entidad) a través de los parámetros de sus métodos.
class Flyweight {
  final Car _sharedState;

  Flyweight(this._sharedState);

  void operation(Car uniqueState) {
    String s = jsonEncode(_sharedState.toJson());
    String u = jsonEncode(uniqueState.toJson());
    print('Flyweight: Displaying shared $s and unique $u state.');
  }
}

// La fábrica de Flyweight crea y gestiona los objetos Flyweight. 
// Garantiza que los flyweights se compartan correctamente. 
// Cuando el cliente solicita un flyweight, la fábrica devuelve una instancia existente o 
// crea una nueva, si aún no existe.
class FlyweightFactory {
  final List<MapEntry<Flyweight, String>> flyweights = [];

  FlyweightFactory(List<Car> initialFlyweights) {
    for (var elem in initialFlyweights) {
      flyweights.add(MapEntry(Flyweight(elem), getKey(elem)));
    }
  }

  // Devuelve una clave hash del Flyweight para un estado dado.
  String getKey(Car key) {
    var elements = [key.model, key.color, key.company];

    if (key.owner != null && key.number != null) {
      elements.add(key.number);
      elements.add(key.owner);
    }

    elements.sort();
    return elements.join('_');
  }

  // Devuelve un Flyweight existente con un estado dado o crea uno nuevo.
  Flyweight getFlyweight(Car sharedState) {
    String key = getKey(sharedState);

    for (var entry in flyweights) {
      if (entry.value == key) {
        print('FlyweightFactory: Reusing existing flyweight.');
        return entry.key;
      }
    }

    print('FlyweightFactory: Can\'t find a flyweight, creating new one.');
    var flyweight = Flyweight(sharedState);
    flyweights.add(MapEntry(flyweight, key));
    return flyweight;
  }

  void listFlyweights() {
    print('\nFlyweightFactory: I have ${flyweights.length} flyweights:');
    for (var entry in flyweights) {
      print(entry.value);
    }
  }
}

class Car {
  String? owner;
  String? number;
  String? company;
  String? model;
  String? color;

  Car({this.owner, this.number, this.company, this.model, this.color});

  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'number': number,
      'company': company,
      'model': model,
      'color': color,
    };
  }
}

void addCarToPoliceDatabase(FlyweightFactory factory, Car car) {
  print('\nClient: Adding a car to database.');

  var flyweight = factory.getFlyweight(Car(
    color: car.color,
    model: car.model,
    company: car.company,
  ));

  flyweight.operation(car);
}

void main() {
  var factory = FlyweightFactory([
    Car(company: 'Chevrolet', model: 'Camaro2018', color: 'pink'),
    Car(company: 'Mercedes Benz', model: 'C300', color: 'black'),
    Car(company: 'Mercedes Benz', model: 'C500', color: 'red'),
    Car(company: 'BMW', model: 'M5', color: 'red'),
    Car(company: 'BMW', model: 'X6', color: 'white'),
  ]);

  factory.listFlyweights();

  addCarToPoliceDatabase(factory, Car(
    number: 'CL234IR',
    owner: 'James Doe',
    company: 'BMW',
    model: 'M5',
    color: 'red',
  ));

  addCarToPoliceDatabase(factory, Car(
    number: 'CL234IR',
    owner: 'James Doe',
    company: 'BMW',
    model: 'X1',
    color: 'red',
  ));

  factory.listFlyweights();
}
