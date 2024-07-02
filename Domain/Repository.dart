class Product {
  int id;
  String? name;
  double price;

  Product({required this.id, this.name, required this.price});
}

abstract class IProductRepository {
  void add(Product product);
  Product? get(int id);
}

class ProductRepository implements IProductRepository {
  final List<Product> _products = [];

  @override
  void add(Product product) {
    _products.add(product);
  }

  @override
  Product? get(int id) {
    return _products.firstWhere((p) => p.id == id);
  }
}

void main() {
  IProductRepository repository = ProductRepository();

  var product = Product(id: 1, name: "Laptop", price: 999.99);
  repository.add(product);

  var retrievedProduct = repository.get(1);
  if (retrievedProduct != null) {
    print('Retrieved product: ${retrievedProduct.name}, Price: ${retrievedProduct.price}');
  } else {
    print('Product not found');
  }
}


