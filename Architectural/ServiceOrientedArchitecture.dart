// Este patrón utiliza servicios para ofrecer funcionalidades específicas y modularizadas.
// Servicio de ejemplo en SOA

abstract class IOrderService {
  void placeOrder(Order order);
}

class OrderService implements IOrderService {
  @override
  void placeOrder(Order order) {
    print("Order placed: ${order.productName}");
  }
}

class Order {
  int id;
  String? productName;
  int quantity;

  Order({required this.id, this.productName, required this.quantity});
}

void main() {
  IOrderService orderService = OrderService();
  orderService.placeOrder(Order(id: 1, productName: "Laptop", quantity: 1));
}


