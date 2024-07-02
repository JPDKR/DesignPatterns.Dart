class Customer {
  int? id;
  String? name;
  String? email;

  Customer({this.id, this.name, this.email});
}

class Order {
  int? id;
  DateTime orderDate;
  int? customerId;

  Order({this.id, required this.orderDate, this.customerId});
}

abstract class IRepository<T> {
  void add(T entity);
  void update(T entity);
  void delete(int id);
  T? getById(int id);
  List<T> getAll();
}

class Repository<T> implements IRepository<T> {
  final List<T> _entities = [];

  @override
  void add(T entity) {
    _entities.add(entity);
  }

  @override
  void update(T entity) {
    // Actualizar entidad en la lista (simulado)
  }

  @override
  void delete(int id) {
    _entities.removeWhere((entity) => (entity as dynamic).id == id);
  }

  @override
  T? getById(int id) {
    return _entities.firstWhere((entity) => (entity as dynamic).id == id);
  }

  @override
  List<T> getAll() {
    return _entities;
  }
}

abstract class IUnitOfWork {
  IRepository<Customer> get customers;
  IRepository<Order> get orders;
  void save();
  void dispose();
}

class UnitOfWork implements IUnitOfWork {
  final IRepository<Customer> _customerRepository = Repository<Customer>();
  final IRepository<Order> _orderRepository = Repository<Order>();

  @override
  IRepository<Customer> get customers => _customerRepository;

  @override
  IRepository<Order> get orders => _orderRepository;

  @override
  void save() {
    // Simular la confirmación de transacciones
    print('All changes have been committed.');
  }

  @override
  void dispose() {
    // Limpiar recursos si es necesario
  }
}

void main() {
  final unitOfWork = UnitOfWork();

  final newCustomer = Customer(name: 'John Doe', email: 'john@example.com');
  unitOfWork.customers.add(newCustomer);

  final newOrder = Order(orderDate: DateTime.now(), customerId: newCustomer.id);
  unitOfWork.orders.add(newOrder);

  unitOfWork.save();
  unitOfWork.dispose();
}