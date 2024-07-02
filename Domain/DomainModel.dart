class Product {
  int? id;
  String? name;
  double price;
  int? stockQuantity;

  Product({this.id, this.name, required this.price, this.stockQuantity});
  // Otros atributos y métodos relacionados con Product
}

class Order {
  int? id;
  DateTime? orderDate;
  List<OrderItem>? orderItems;

  Order({this.id, this.orderDate, this.orderItems});
  // Otros atributos y métodos relacionados con Order

  double calculateTotal() {
    return orderItems!.fold(0, (total, item) => total + (item.quantity * item.product!.price));
  }
}

class OrderItem {
  int? id;
  Product? product;
  int quantity;

  OrderItem({this.id, this.product, required this.quantity});
  // Otros atributos y métodos relacionados con OrderItem
}


