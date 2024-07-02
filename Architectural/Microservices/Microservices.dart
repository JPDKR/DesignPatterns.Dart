// import 'dart:convert';
// import 'package:shelf/shelf.dart';
// import 'package:shelf/shelf_io.dart' as io;
// import 'package:shelf_router/shelf_router.dart';

// void main() async {
//   final router = Router();

//   final products = <Map<String, dynamic>>[
//     {'id': 1, 'name': 'Laptop', 'price': 1000},
//     {'id': 2, 'name': 'Phone', 'price': 500},
//   ];

//   // Obtener todos los productos
//   router.get('/products', (Request request) {
//     return Response.ok(jsonEncode(products), headers: {'Content-Type': 'application/json'});
//   });

//   // Obtener un producto por ID
//   router.get('/products/<id|[0-9]+>', (Request request, String id) {
//     final product = products.firstWhere((product) => product['id'] == int.parse(id), orElse: () => null);
//     if (product == null) {
//       return Response.notFound('Product not found');
//     }
//     return Response.ok(jsonEncode(product), headers: {'Content-Type': 'application/json'});
//   });

//   // Crear un nuevo producto
//   router.post('/products', (Request request) async {
//     final payload = await request.readAsString();
//     final product = jsonDecode(payload) as Map<String, dynamic>;
//     products.add(product);
//     return Response.ok(jsonEncode(product), headers: {'Content-Type': 'application/json'});
//   });

//   // Actualizar un producto
//   router.put('/products/<id|[0-9]+>', (Request request, String id) async {
//     final payload = await request.readAsString();
//     final updatedProduct = jsonDecode(payload) as Map<String, dynamic>;
//     final index = products.indexWhere((product) => product['id'] == int.parse(id));
//     if (index == -1) {
//       return Response.notFound('Product not found');
//     }
//     products[index] = updatedProduct;
//     return Response.ok(jsonEncode(updatedProduct), headers: {'Content-Type': 'application/json'});
//   });

//   // Eliminar un producto
//   router.delete('/products/<id|[0-9]+>', (Request request, String id) {
//     final index = products.indexWhere((product) => product['id'] == int.parse(id));
//     if (index == -1) {
//       return Response.notFound('Product not found');
//     }
//     final removedProduct = products.removeAt(index);
//     return Response.ok(jsonEncode(removedProduct), headers: {'Content-Type': 'application/json'});
//   });

//   final handler = const Pipeline()
//       .addMiddleware(logRequests())
//       .addHandler(router);

//   final server = await io.serve(handler, 'localhost', 8080);
//   print('Server listening on port ${server.port}');
// }