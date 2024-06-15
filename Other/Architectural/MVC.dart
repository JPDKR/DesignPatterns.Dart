// Model
class Product {
  int id;
  String? name;
  double price;

  Product({required this.id, this.name, required this.price});
}

// View
class ProductView {
  void displayProductDetails(Product product) {
    print('Product: ${product.name}, Price: ${product.price}');
  }
}

// Controller
class ProductController {
  Product _product;
  ProductView _view;

  ProductController(this._product, this._view);

  void updateProductName(String name) {
    _product.name = name;
  }

  void updateProductPrice(double price) {
    _product.price = price;
  }

  void displayProduct() {
    _view.displayProductDetails(_product);
  }
}

void main() {
  Product product = Product(id: 1, name: 'Laptop', price: 999.99);
  ProductView view = ProductView();
  ProductController controller = ProductController(product, view);

  controller.displayProduct();
  controller.updateProductName('Gaming Laptop');
  controller.updateProductPrice(1299.99);
  controller.displayProduct();
}